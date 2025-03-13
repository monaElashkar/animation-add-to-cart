// import 'package:bluezone_task/core/theme/app_color.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class TextWithShowMoreButton extends StatefulWidget {
//   const TextWithShowMoreButton(
//       this.text, {
//         required Key key,
//         this.trimLines = 2,
//       })  : assert(text != null),
//         super(key: key);

//   final String? text;
//   final int trimLines;

//   @override
//   TextWithShowMoreButtonState createState() => TextWithShowMoreButtonState();
// }

// class TextWithShowMoreButtonState extends State<TextWithShowMoreButton> {
//   bool _readMore = true;

//   void _onTapLink() {
//     setState(() => _readMore = !_readMore);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
//     final colorClickableText = AppColors.primerColor;

//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         final double maxWidth = constraints.maxWidth;

//         // Measure text to determine if it exceeds `trimLines`
//         final TextPainter textPainter = TextPainter(
//           text: TextSpan(
//             text: widget.text,
//             style: defaultTextStyle.style,
//           ),
//           maxLines: widget.trimLines,
//           textDirection: TextDirection.ltr,
//         )..layout(maxWidth: maxWidth);

//         // Check if text exceeds the trim lines
//         final bool textExceedsTrimLines = textPainter.didExceedMaxLines;

//         if (!textExceedsTrimLines) {
//           // If text doesn't exceed trim lines, just return the text
//           return Text(
//             widget.text??'',
//             style: TextStyle(
//               fontSize: 14.0,
//               fontWeight: FontWeight.w400,
//               color: AppColors.black,
//               fontFamily: 'NewFont',
//             ),
//           );
//         }

//         // Create the "read more/read less" link
//         final TextSpan link = TextSpan(
//           text: _readMore ?  ("... read more") : (" read less"),
//           style: TextStyle(
//             color: colorClickableText,
//           ),
//           recognizer: TapGestureRecognizer()..onTap = _onTapLink,
//         );

//         // Create the text with or without truncation
//         final int? endIndex = textPainter.getOffsetBefore(
//           textPainter.getPositionForOffset(
//             Offset(
//               maxWidth,
//               textPainter.height,
//             ),
//           ).offset,
//         );

//         final TextSpan textSpan = TextSpan(
//           text: _readMore
//               ? widget.text.substring(0, endIndex) + '...'
//               : widget.text,
//           style: TextStyle(
//             fontSize: 14.0,
//             fontWeight: FontWeight.w400,
//             color: AppColors.black,
//             fontFamily: 'NewFont',
//           ),
//           children: _readMore ? [link] : [link],
//         );

//         return RichText(
//           softWrap: true,
//           overflow: TextOverflow.clip,
//           text: textSpan,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // ✅ Add this import

class TextWithShowMoreButton extends StatefulWidget {
  const TextWithShowMoreButton(
      this.text, {
        super.key,
        this.trimLines = 2,
      });

  final String text;
  final int trimLines;

  @override
  TextWithShowMoreButtonState createState() => TextWithShowMoreButtonState();
}

class TextWithShowMoreButtonState extends State<TextWithShowMoreButton> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    final colorClickableText = Colors.blue; // Replace with AppColors if needed

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;

        // Measure text to determine if it exceeds `trimLines`
        final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: widget.text,
            style: defaultTextStyle.style,
          ),
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: maxWidth);

        final bool textExceedsTrimLines = textPainter.didExceedMaxLines;

        if (!textExceedsTrimLines) {
          return Text(
            widget.text,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black, // Replace with AppColors.black if needed
              fontFamily: 'NewFont',
            ),
          );
        }

        // Calculate the cutoff index safely
        final int? endIndex = textPainter.getPositionForOffset(
          Offset(maxWidth, textPainter.height),
        ).offset;

        final String visibleText = (_readMore && endIndex != null)
            ? widget.text.substring(0, endIndex).trim() + '...'
            : widget.text;

        final TextSpan link = TextSpan(
          text: _readMore ? " Read more" : " Read less",
          style: TextStyle(
            color: colorClickableText,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()..onTap = _onTapLink, // ✅ Fixed error
        );

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: TextSpan(
            text: visibleText,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.black, // Replace with AppColors.black if needed
              fontFamily: 'NewFont',
            ),
            children: [link],
          ),
        );
      },
    );
  }
}

