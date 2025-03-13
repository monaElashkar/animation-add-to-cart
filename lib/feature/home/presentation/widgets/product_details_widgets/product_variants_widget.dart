import 'package:bluezone_task/core/theme/app_color.dart';
import 'package:bluezone_task/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ProductVariantsWidget extends StatefulWidget {
  final List<String> variants ;
  final String name ;
  final Function(String) onVariantSelected;
  ProductVariantsWidget({super.key,required this.variants,required this.name,required this.onVariantSelected});

  @override
  State<ProductVariantsWidget> createState() => _ProductVariantsWidgetState();
}

class _ProductVariantsWidgetState extends State<ProductVariantsWidget> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name, style: AppStyles.size16BoldColorBlack(context)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: widget.variants.map((item) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  
                  selectedItem = item;
                  widget.onVariantSelected(item);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: EdgeInsets.only(bottom: 3),
                decoration: BoxDecoration(
                  color: selectedItem == item ? AppColors.black : AppColors.grey300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  item,
                  style: TextStyle(
                      color:
                          selectedItem == item ? AppColors.white : AppColors.black),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
