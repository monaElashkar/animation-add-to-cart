import 'package:flutter/material.dart';
import 'app_color.dart';
import 'size_config.dart';

class AppStyles {
  static TextStyle size12W400ColorBlack(BuildContext context,
      {double? fontSize}) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 12),
        fontWeight: FontWeight.w400,
        color: AppColors.black);
  }
  
  static TextStyle size16W700ColorBlack(BuildContext context,
      {double? fontSize}) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 16.0),
        fontWeight: FontWeight.w700,
        color: AppColors.black);
  }

  static TextStyle customResponsiveTextInputs(
      {required BuildContext context,
      double? fontSize,
      double? height,
      Color? colors,
      FontWeight? fontWeight,
      Color? backgroundColor}) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: fontSize ?? 10),
      fontWeight: fontWeight ?? FontWeight.w400,
      backgroundColor: backgroundColor,
      color: colors ?? AppColors.black,
      height: height,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiceFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;

  double upperLimit = fontSize * 1.2;

  return responsiceFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
