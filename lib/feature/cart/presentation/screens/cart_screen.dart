import 'package:bluezone_task/core/theme/app_color.dart';
import 'package:bluezone_task/feature/cart/presentation/provider/cart_provider.dart';
import 'package:bluezone_task/feature/cart/presentation/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/shared_widgets/custom_text_form_fild.dart';
import '../../../../core/route/app_routes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false)..getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Visibility(
        visible: provider.cartList.isNotEmpty,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.cartList.length,
                itemBuilder: (context, index) => CartListItem(
                  remove: (item) {
                    provider.removeFromCart(item, codeController.text);
                  },
                  onTap: () {
                    Navigator.pushNamed(context, Routers.productDetailsScreen,
                        arguments: provider.cartList[index].product);
                  },
                  cartItem: provider.cartList[index],
                ),
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                        controller: codeController,
                        keyboardType: TextInputType.text,
                        hintText: 'enter code',
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your code';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider
                              .discountedPriceCalculated(codeController.text);
                        }
                      },
                      child: Text('apply'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Before Discount:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${provider.total}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total After Discount: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${provider.totalDiscounted}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  minimumSize: Size(double.infinity, 55),
                ),
                onPressed: () {},
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
        replacement: Center(
          child: Text('Your cart is empty'),
        ),
      ),
    );
  }
}
