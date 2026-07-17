import 'package:ecommerce_dash_board/features/orders/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/shipping_address_entity/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final CartEntity cartEntity;
  final ShippingAddressEntity shippingAddressEntity;
  final bool payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusEntity orderStatusEntity;
  final CardEntity cardEntity;

  OrderEntity({
    required this.cartEntity,
    required this.payWithCash,
    required this.shippingAddressEntity,
    required this.uId,
    required this.date,
    required this.orderNumber,
    required this.orderStatusEntity,
    required this.totalPrice,
    required this.cardEntity,
  });
}
