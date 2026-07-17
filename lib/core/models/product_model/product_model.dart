
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';

class ProductModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String description;
  final String productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.description,
    required this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["productName"],
      productPrice: json["productPrice"],
      productCode: json["productCode"],
      description: json["productDiscription"],
      isOrganicProduct: json["isOrganicProduct"],
      expirationYears: json["expirationYears"],
      numberOfCalories: json["numberOfCalories"],
      unitAmount: json["unitAmount"],
      productImageUrl: json["productImageUrl"],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productImage: productImageUrl,
      productName: productName,
      productPrice: productPrice,
      productCode: productCode,
      productDiscription: description,
      isOrganicProduct: isOrganicProduct,
      expirationYears: expirationYears,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
    );
  }

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      isOrganicProduct: productEntity.isOrganicProduct,
      productName: productEntity.productName,
      productPrice: productEntity.productPrice,
      productCode: productEntity.productCode,
      description: productEntity.productDiscription,
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
      "productDiscription": description,
      "productImageUrl": productImageUrl,
      "isOrganicProduct": isOrganicProduct,
    };
  }
}
