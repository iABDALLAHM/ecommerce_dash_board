import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';

abstract class FeaturedProductsRepository {
  Future<Either<Failure, void>> addFeaturedProduct({
    required FeaturedProductEntity featuredProduct,
  });
}
