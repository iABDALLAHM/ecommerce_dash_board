import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';

abstract class ProductsRepostory {
  Future<Either<Failure,void>> addProduct({required ProductEntity productEntity});
}
