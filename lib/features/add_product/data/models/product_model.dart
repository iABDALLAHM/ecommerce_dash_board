import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final num price;
  final File? image;
  final String code;
  final String discription;
  final bool isFeatured;
  final String? imageUrl;

  ProductModel({
    required this.name,
    required this.price,
    this.image,
    required this.code,
    required this.discription,
    required this.isFeatured,
    required this.imageUrl,
  });

  factory ProductModel.fromEntity({required ProductEntity productEntity}) {
    return ProductModel(
      name: productEntity.name,
      price: productEntity.price,
      code: productEntity.code,
      discription: productEntity.discription,
      isFeatured: productEntity.isFeatured,
      imageUrl: productEntity.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "code": code,
      "description": discription,
      "isFeatured": isFeatured,
      "imageUrl": imageUrl,
      "isOrganic": "isOrganic",
    };
  }
}
