import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/data/models/review_model.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String productName;
  final num productPrice;
  final File? productImage;
  final String productCode;
  final String productDiscription;
  final bool isFeaturedProduct;
  final String? productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating, ratingCount;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel({
    required this.productName,
    required this.productPrice,
    this.productImage,
    required this.productCode,
    required this.productDiscription,
    required this.isFeaturedProduct,
    required this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.averageRating,
    required this.ratingCount,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      reviews: productEntity.reviews
          .map(
            (reviewEntity) =>
                ReviewModel.fromEntity(reviewEntity: reviewEntity),
          )
          .toList(),
      isOrganicProduct: productEntity.isOrganicProduct,
      productName: productEntity.productName,
      productPrice: productEntity.productPrice,
      productCode: productEntity.productCode,
      productDiscription: productEntity.productDiscription,
      isFeaturedProduct: productEntity.isFeaturedProduct,
      productImageUrl: productEntity.productImageUrl,
      expirationYears: productEntity.expirationYears,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
      averageRating: productEntity.averageRating,
      ratingCount: productEntity.ratingCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "sellingCount": sellingCount,
      "reviews": reviews.map((reviewModel) => reviewModel.toMap()).toList(),
      "ratingCount": ratingCount,
      "averageRating": averageRating,
      "unitAmount": unitAmount,
      "numberOfCalories": numberOfCalories,
      "expirationYears": expirationYears,
      "productName": productName,
      "productPrice": productPrice,
      "productCode": productCode,
      "productDiscription": productDiscription,
      "isFeaturedProduct": isFeaturedProduct,
      "productImageUrl": productImageUrl,
      "isOrganicProduct": isOrganicProduct,
    };
  }
}
