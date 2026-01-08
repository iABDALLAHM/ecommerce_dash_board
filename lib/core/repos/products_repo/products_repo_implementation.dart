import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_product/data/models/product_model.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DatabaseService databaseService;
  ProductsRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct({
    required ProductEntity productEntity,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.addProducts,
        data: ProductModel.fromEntity(productEntity: productEntity).toMap(),
      );
      return Right(null);
    } catch (e) {
      log("this error happend in ProductsRepoImplementation in addProduct $e");
      return Left(
        ServerFailure(errorMessage: "لقد حدث خطأ ما اثناء رفع بيانات المنتج"),
      );
    }
  }
}
