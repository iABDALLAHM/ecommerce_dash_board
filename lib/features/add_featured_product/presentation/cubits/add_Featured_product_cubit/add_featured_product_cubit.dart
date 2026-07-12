import 'dart:io';

import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/repositories/featured_products_repository/featured_products_repository.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_state.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeaturedProductCubit extends Cubit<AddFeaturedProductState> {
  AddFeaturedProductCubit({
    required FeaturedProductsRepository featuredProductRepository,
    required ImagesRepository imageRepo,
  }) : _featuredProductRepository = featuredProductRepository,
       _imagesRepo = imageRepo,

       super(InitialAddFeaturedProductState());

  final FeaturedProductsRepository _featuredProductRepository;
  final ImagesRepository _imagesRepo;

  Future addFeaturedProduct({required FeaturedProductEntity product}) async {
    emit(LoadingAddFeaturedProductState());

    var response = await _imagesRepo.uploadImage(
      file: File(product.image),
      path: BackendEndPoints.featuredProducts,
    );

    response.fold(
      (failure) {
        emit(
          FailureAddFeaturedProductState(errorMessage: failure.errorMessage),
        );
      },
      (imageUrl) async {
        final updatedFeaturedProduct = product.copyWith(image: imageUrl);

        var result = await _featuredProductRepository.addFeaturedProduct(
          featuredProduct: updatedFeaturedProduct,
        );

        result.fold(
          (failure) {
            emit(
              FailureAddFeaturedProductState(
                errorMessage: failure.errorMessage,
              ),
            );
          },
          (result) {
            emit(SuccessAddFeaturedProductState());
          },
        );
        
      },
    );
  }
}
