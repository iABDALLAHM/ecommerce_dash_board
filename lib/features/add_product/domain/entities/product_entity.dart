import 'dart:io';

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
  });
}
