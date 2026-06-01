import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/domain/repos/images_repo/images_repo.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repos/products_repo/products_repo.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(InitialAddProductState());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct({required ProductEntity productEntity}) async {
    emit(LoadingAddProductState());



    if (!productEntity.isFeaturedProduct || !productEntity.isOrganicProduct) {
      emit(FailureAddProductState(errorMessage: "اكمل الحقول"));
      return;
    }
    
    final File image = File(productEntity.productImage);

    var result = await imagesRepo.uploadImage(
      file: image,
      path: BackendEndPoints.imagesPath,
    );

    result.fold(
      (failure) {
        emit(FailureAddProductState(errorMessage: failure.errorMessage));
      },
      (imageUrl) async {
        final updatedProduct = productEntity.copyWith(
          productImageUrl: imageUrl,
        );

        var result = await productsRepo.addProduct(
          productEntity: updatedProduct,
        );

        result.fold(
          (failure) =>
              emit(FailureAddProductState(errorMessage: failure.errorMessage)),
          (success) => emit(SuccessAddProductState()),
        );
      },
    );
  }
}
