import 'dart:io';

import 'package:ecommerce_dash_board/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final File image;
  final String code;
  final String discription;
  final bool isFeatured;
  String? imageUrl;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.price,
    required this.image,
    required this.code,
    required this.discription,
    required this.isFeatured,
    this.imageUrl,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.averageRating = 0,
    this.ratingCount = 0,
    required this.reviews,
  });
}
