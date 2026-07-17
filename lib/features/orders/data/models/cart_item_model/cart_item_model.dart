import 'package:ecommerce_dash_board/core/models/product_model/product_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/cart_item_entity/cart_item_entity.dart';

class CartItemModel {
  final ProductModel productModel;
  int quantity;

  CartItemModel({required this.productModel, required this.quantity});

  factory CartItemModel.fromEntity({required CartItemEntity cartItemEntity}) {
    return CartItemModel(
      productModel: ProductModel.fromEntity(
        productEntity: cartItemEntity.productEntity,
      ),
      quantity: cartItemEntity.quantity,
    );
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productModel: ProductModel.fromJson(json["productModel"]),
      quantity: json["quantity"],
    );
  }

  CartItemEntity toEntity() {
    return CartItemEntity(
      quantity: quantity,
      productEntity: productModel.toEntity(),
    );
  }

  Map<String, dynamic> toMap() {
    return {"productModel": productModel.toMap(), "quantity": quantity};
  }
}
