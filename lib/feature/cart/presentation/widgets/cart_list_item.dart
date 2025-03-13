import 'package:bluezone_task/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_styles.dart';

class CartListItem extends StatelessWidget {
  final GlobalKey widgetKey = GlobalKey();
  final CartModel cartItem;
  final void Function(CartModel) remove;
  final void Function()? onTap;

  CartListItem({super.key, required this.cartItem, required this.onTap, required this.remove});
  @override
  Widget build(BuildContext context) {
    Container mandatoryContainer = Container(
      key: widgetKey,
      width: 60,
      height: 60,
      color: Colors.transparent,
      child: Image.asset(cartItem.product.image, width: 60, height: 60),
    );

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: mandatoryContainer,
        subtitle: Column(children: [
          cartItem.product.discountedPrice != cartItem.product.price
              ? Row(
                  children: [
                    Text(
                      "${cartItem.product.price} EGP",
                      style: AppStyles.size16ColorGreyLineThrough(context),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "${cartItem.product.discountedPrice} EGP",
                      style: AppStyles.size18BoldColorRed(context),
                    ),
                  ],
                )
              : Text(
                  "${cartItem.product.price} EGP",
                  style: AppStyles.size18BoldColorRed(context),
                ),
        ]),
        title: Text(
          "${cartItem.product.name}",
          style: AppStyles.size16W700ColorBlack(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle),
          onPressed: () => remove(cartItem),
        )
      ),
    );
  }
}
