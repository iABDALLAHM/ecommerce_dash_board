import 'package:flutter/material.dart';

class CustomAddProductButton extends StatelessWidget {
  const CustomAddProductButton({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff059669),
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      label: Text("إضافة المنتج للمتجر"),
      icon: Icon(Icons.add_rounded),
    );
  }
}
