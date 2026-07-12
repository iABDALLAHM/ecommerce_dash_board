import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/products_repository/products_repostory.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBlocProvider extends StatelessWidget {
  const AddProductViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imagesRepo: getIt.get<ImagesRepository>(),
        productsRepo: getIt.get<ProductsRepostory>(),
      ),
      child: child,
    );
  }
}
