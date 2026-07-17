import 'package:ecommerce_dash_board/features/orders/domain/entities/cart_item_entity/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;

  const CartEntity({required this.items});
}
