import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color.dart';

class OfferProduct extends StatelessWidget {
  final Widget product;
  final bool active;
  final String? offerMessage;
  const OfferProduct({super.key, required this.product, required this.active,this.offerMessage});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: active,
      child: Banner(
          message: offerMessage??'',
          location: BannerLocation.topEnd,
          color: AppColors.primerColor,
          child: product),
      replacement: product,
    );
  }
}
