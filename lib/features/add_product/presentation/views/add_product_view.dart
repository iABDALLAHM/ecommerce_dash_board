import 'package:ecommerce_dash_board/features/add_product/presentation/function/build_add_product_app_bar.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = "AddProduct";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAddProductAppBar(context),
      body: SafeArea(child: AddProductViewBody()),
    );
  }
}
