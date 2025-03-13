import 'package:flutter/material.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const AddToCartButtonWidget({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text("إضافة إلى السلة", style: TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        minimumSize: Size(double.infinity, 55),
      ),
    );
  }
}
  

