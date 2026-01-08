import 'package:ecommerce_dash_board/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_dash_board/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/function/build_add_product_app_bar.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = "AddProduct";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imagesRepo: getIt.get<ImagesRepo>(),
        productsRepo: getIt.get<ProductsRepo>(),
      ),
      child: Scaffold(
        appBar: buildAddProductAppBar(context),
        body: SafeArea(
          child: AddProductViewBodyBlocConsumer(child: AddProductViewBody()),
        ),
      ),
    );
  }
}
