import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/products_repository/products_repostory.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(InitialAddProductState());

  final ImagesRepository imagesRepo;
  final ProductsRepostory productsRepo;

  Future<void> addProduct({required ProductEntity productEntity}) async {
    emit(LoadingAddProductState());

    if (!productEntity.isOrganicProduct) {
      emit(FailureAddProductState(errorMessage: "اكمل الحقول"));
      return;
    }
    print("📸 Original Local Path: ${productEntity.productImage}"); // ← Debug 1

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
        final updatedProduct = productEntity.copyWith(productImage: imageUrl);
        print("✅ Supabase URL: $imageUrl"); // ← Debug 2 (مهم جداً)

        var result = await productsRepo.addProduct(
          productEntity: updatedProduct,
        );

        print(
          "📦 Updated Product Image: ${updatedProduct.productImage}",
        ); // ← Debug 3
        
        result.fold(
          (failure) =>
              emit(FailureAddProductState(errorMessage: failure.errorMessage)),
          (success) => emit(SuccessAddProductState()),
        );
      },
    );
  }
}
