// ignore_for_file: must_be_immutable

import 'package:bluezone_task/feature/home/data/model/product_models.dart';
import 'package:bluezone_task/feature/home/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/shared_widgets/custom_text_with_show_more.dart';
import '../../../../../core/theme/app_styles.dart';

class ProductInfoWidget extends StatelessWidget {
  final Product product;

  ProductInfoWidget({
    super.key,
    required this.product,
  });
  List<Variant> variants = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name ,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              "${product.price} EGP",
              style: AppStyles.size16ColorGreyLineThrough(context),
            ),
            SizedBox(width: 8),
            Text(
              "${product.discountedPrice} EGP",
              style: AppStyles.size18BoldColorRed(context),
            ),
          ],
        ),
        SizedBox(height: 8),
        product.description == null || product.description == ""
            ? SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description", style:  AppStyles.size16BoldColorBlack(context)),
                  TextWithShowMoreButton(
                    product.description ?? '',
                    trimLines: 2,
                  ),
                  SizedBox(height: 8),
                ],
              ),

      ],
    );
  }
}
