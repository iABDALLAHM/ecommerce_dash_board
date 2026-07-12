import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/repositories/featured_products_repository/featured_products_repository.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeaturedProductBlocProvider extends StatelessWidget {
  const AddFeaturedProductBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFeaturedProductCubit(
        imageRepo: getIt.get<ImagesRepository>(),
        featuredProductRepository: getIt.get<FeaturedProductsRepository>(),
      ),
      child: child,
    );
  }
}
