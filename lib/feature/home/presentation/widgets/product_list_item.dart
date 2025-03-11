
import 'package:flutter/material.dart';

import '../../../../core/theme/app_styles.dart';
import '../../data/model/product_models.dart';
import 'offer_product.dart';

class ProductListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final Product product;
  final void Function(GlobalKey, Product) onClick;

  ProductListItem({super.key, required this.onClick, required this.product});
  @override
  Widget build(BuildContext context) {
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.asset(product.image, width: 60, height: 60),
    );

    return Card(
      child: ClipRect(
        child: OfferProduct(
          offerMessage: product.offerMessage,
          active:product.offerMessage!=null? true:false,
          product: ListTile(
            onTap: () => onClick(widgetKey, product),
            leading: mandatoryContainer,
            subtitle: Text("${product.price} EGP",
                style: AppStyles.size12W400ColorBlack(context)),
            title: Text(
              "${product.name}",
              style: AppStyles.size16W700ColorBlack(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
