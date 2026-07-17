import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  final int quantity;

  CartItemEntity({required this.productEntity, required this.quantity});
}
