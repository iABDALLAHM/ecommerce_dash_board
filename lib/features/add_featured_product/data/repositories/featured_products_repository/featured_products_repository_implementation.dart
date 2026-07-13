import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/data/models/featured_product_model/featured_product_model.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/repositories/featured_products_repository/featured_products_repository.dart';

class FeaturedProductsRepositoryImplementation implements FeaturedProductsRepository {
  final DatabaseService _databaseService;

  FeaturedProductsRepositoryImplementation({required DatabaseService databaseService})
    : _databaseService = databaseService;

  @override
  Future<Either<Failure, void>> addFeaturedProduct({
    required FeaturedProductEntity featuredProduct,
  }) async {
    try {
      await _databaseService.addData(
        path: BackendEndPoints.featuredProductsCollection,
        data: FeaturedProductModel.fromEntity(
          productEntity: featuredProduct,
        ).toMap(),
      );
      return Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
