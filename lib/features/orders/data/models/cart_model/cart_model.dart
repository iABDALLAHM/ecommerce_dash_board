import 'package:ecommerce_dash_board/features/orders/data/models/cart_item_model/cart_item_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/cart_entity/cart_entity.dart';

class CartModel {
  final List<CartItemModel> items;

  const CartModel({required this.items});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json["items"] as List)
          .map((ele) => CartItemModel.fromJson(ele))
          .toList(),
    );
  }

  CartEntity toEntity() {
    return CartEntity(items: items.map((ele) => ele.toEntity()).toList());
  }
}
