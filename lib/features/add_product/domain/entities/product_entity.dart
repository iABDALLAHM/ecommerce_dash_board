import 'dart:io';

import 'package:ecommerce_dash_board/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String productName;
  final num productPrice;
  final File productImage;
  final String productCode;
  final String productDiscription;
  final bool isFeaturedProduct;
  String? productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productCode,
    required this.productDiscription,
    required this.isFeaturedProduct,
    this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
    this.averageRating = 0,
    this.ratingCount = 0,
    required this.reviews,
  });
}
