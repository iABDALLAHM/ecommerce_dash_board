import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';

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
      label: Text(LocaleKeys.addProduct_addButton.tr()),
      icon: Icon(Icons.add_rounded),
    );
  }
}
