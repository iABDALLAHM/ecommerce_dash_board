import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/views/widgets/add_featured_product_bloc_provider.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/views/widgets/add_featured_product_body.dart';
import 'package:flutter/material.dart';

class AddFeaturedProductView extends StatelessWidget {
  const AddFeaturedProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return AddFeaturedProductBlocProvider(
      child: Scaffold(appBar: buildAppBar(), body: AddFeaturedProductBody()),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: CustomArrowBack(),
      title: Text(
        "إضافة المنتجات والبانرات المميزة",
        style: AppStyles.textStyle16Bold,
      ),
      centerTitle: true,
    );
  }
}
