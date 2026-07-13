import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/products_repository/products_repostory.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_product/data/models/product_model/product_model.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';

class ProductsRepositoryImplementation implements ProductsRepostory {
  final DatabaseService databaseService;

  ProductsRepositoryImplementation({required this.databaseService});

  @override
  Future<Either<Failure, void>> addProduct({
    required ProductEntity productEntity,
  }) async {
    try {
      await databaseService.addSingleData(
        path: BackendEndPoints.productsCollection,
        data: ProductModel.fromEntity(productEntity: productEntity).toMap(),
        documentId: productEntity.productCode,
      );
      return Right(null);
    } on CustomException catch (e) {
      log("this error happend in ProductsRepoImplementation in addProduct $e");
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
