import 'package:ecommerce_dash_board/features/orders/domain/entities/product_item_entity.dart/product_item_entity.dart';

class ProductItemModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final int quantity;

  ProductItemModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      name: json["name"],
      code: json["code"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      quantity: json["quantity"],
    );
  }
  ProductItemEntity toEntity() {
    return ProductItemEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
    );
  }

}
