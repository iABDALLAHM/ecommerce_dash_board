import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_status_entity/order_status_entity.dart';

class OrderStatusModel {
  final bool acceptOrder;
  final DateTime? acceptedAt;

  final bool orderShipped;
  final DateTime? shippedAt;

  final bool outOfDelivery;
  final DateTime? outOfDeliveryAt;

  final bool orderDelivered;
  final DateTime? deliverdAt;

  OrderStatusModel({
    required this.acceptOrder,
    required this.acceptedAt,
    required this.orderShipped,
    required this.shippedAt,
    required this.outOfDelivery,
    required this.outOfDeliveryAt,
    required this.orderDelivered,
    required this.deliverdAt,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) {
    return OrderStatusModel(
      acceptOrder: json["acceptOrder"],
      orderShipped: json["orderShipped"],
      outOfDelivery: json["outOfDelivery"],
      orderDelivered: json["orderDelivered"],
      acceptedAt: json["acceptedAt"] != null
          ? (json["acceptedAt"] as Timestamp).toDate()
          : null,
      shippedAt: json["shippedAt"] != null
          ? (json["shippedAt"] as Timestamp).toDate()
          : null,
      outOfDeliveryAt: json["outOfDeliveryAt"] != null
          ? (json["outOfDeliveryAt"] as Timestamp).toDate()
          : null,
      deliverdAt: json["deliverdAt"] != null
          ? (json["deliverdAt"] as Timestamp).toDate()
          : null,
    );
  }

  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      acceptOrder: acceptOrder,
      acceptedAt: acceptedAt,
      shippedAt: shippedAt,
      orderShipped: orderShipped,
      outOfDelivery: outOfDelivery,
      outOfDeliveryAt: outOfDeliveryAt,
      orderDelivered: orderDelivered,
      deliverdAt: deliverdAt,
    );
  }
}
