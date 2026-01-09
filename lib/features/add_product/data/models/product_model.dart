import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/data/models/review_model.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final num price;
  final File? image;
  final String code;
  final String discription;
  final bool isFeatured;
  final String? imageUrl;
  final bool isOrganic;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final List<ReviewModel> reviews;
  ProductModel({
    required this.name,
    required this.price,
    this.image,
    required this.code,
    required this.discription,
    required this.isFeatured,
    required this.imageUrl,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.averageRating,
    required this.ratingCount,
    required this.reviews,
  });

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      reviews: productEntity.reviews
          .map(
            (reviewEntity) =>
                ReviewModel.fromEntity(reviewEntity: reviewEntity),
          )
          .toList(),
      isOrganic: productEntity.isOrganic,
      name: productEntity.name,
      price: productEntity.price,
      code: productEntity.code,
      discription: productEntity.discription,
      isFeatured: productEntity.isFeatured,
      imageUrl: productEntity.imageUrl,
      expirationMonths: productEntity.expirationMonths,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
      averageRating: productEntity.averageRating,
      ratingCount: productEntity.ratingCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "reviews": reviews.map((reviewModel) => reviewModel.toMap()).toList(),
      "ratingCount": ratingCount,
      "averageRating": averageRating,
      "unitAmount": unitAmount,
      "numberOfCalories": numberOfCalories,
      "expirationMonths": expirationMonths,
      "name": name,
      "price": price,
      "code": code,
      "description": discription,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
      "isOrganic": isOrganic,
    };
  }
}
