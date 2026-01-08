import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAddProductAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios_new),
    ),
    centerTitle: true,
    title: Text("إضافة المنتج", style: AppStyles.textStyle23Bold),
  );
}
