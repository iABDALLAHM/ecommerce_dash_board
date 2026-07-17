import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/card_model/card_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/cart_model/cart_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_status_model/order_status_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/shipping_address_model/shipping_address_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final CartModel cartModel;
  final ShippingAddressModel shippingAddressModel;
  final bool payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusModel orderStatusModel;
  final CardModel cardModel;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.payWithCash,
    required this.date,
    required this.orderNumber,
    required this.orderStatusModel,
    required this.cardModel,
    required this.cartModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      cardModel: CardModel.fromJson(
        (json["cardModel"] as Map<String, dynamic>),
      ),
      totalPrice: json["totalPrice"],
      uId: json["uId"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        (json["shippingAddressModel"] as Map<String, dynamic>),
      ),
      payWithCash: json["payWithCash"],
      date: (json["date"] as Timestamp).toDate(),
      orderNumber: json["orderNumber"],
      orderStatusModel: OrderStatusModel.fromJson(json["orderStatusModel"]),
      cartModel: CartModel.fromJson(json["cartModel"]),
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      cartEntity: cartModel.toEntity(),
      shippingAddressEntity: shippingAddressModel.toEntity(),
      uId: uId,
      payWithCash: payWithCash,
      date: date,
      orderNumber: orderNumber,
      orderStatusEntity: orderStatusModel.toEntity(),
      totalPrice: totalPrice,
      cardEntity: cardModel.toEntity(),
    );
  }
}
