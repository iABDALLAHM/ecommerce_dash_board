import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';

class ProductModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDiscription;
  final String productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDiscription,
    required this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      isOrganicProduct: productEntity.isOrganicProduct,
      productName: productEntity.productName,
      productPrice: productEntity.productPrice,
      productCode: productEntity.productCode,
      productDiscription: productEntity.productDiscription,
      productImageUrl: productEntity.productImage,
      expirationYears: productEntity.expirationYears,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "unitAmount": unitAmount,
      "numberOfCalories": numberOfCalories,
      "expirationYears": expirationYears,
      "productName": productName,
      "productPrice": productPrice,
      "productCode": productCode,
      "productDiscription": productDiscription,
      "productImageUrl": productImageUrl,
      "isOrganicProduct": isOrganicProduct,
    };
  }
}
