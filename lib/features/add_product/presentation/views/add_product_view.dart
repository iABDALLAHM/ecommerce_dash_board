import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/add_product_body.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/add_product_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return AddProductViewBlocProvider(
      child: Scaffold(
        appBar: buildAddProductAppBar(),
        body: SafeArea(child: AddProductBody()),
      ),
    );
  }

  AppBar buildAddProductAppBar() => AppBar(
    centerTitle: true,
    leading: CustomArrowBack(),
    title: Text("إضافة منتج جديد", style: AppStyles.textStyle23Bold),
  );
}
