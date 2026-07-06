import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_status_model/order_status_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/product_item_model/product_item_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/shipping_address_model/shipping_address_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/my_order_entity/my_order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final List<ProductItemModel> products;
  final ShippingAddressModel shippingAddressModel;
  final bool payWithCash;
  final DateTime date;
  final String orderNumber;
  final OrderStatusModel orderStatusModel;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.products,
    required this.payWithCash,
    required this.date,
    required this.orderNumber,
    required this.orderStatusModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json["totalPrice"],
      uId: json["uId"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        (json["shippingAddressModel"] as Map<String, dynamic>),
      ),
      products: (json["products"] as List)
          .map((ele) => ProductItemModel.fromJson(ele))
          .toList(),
      payWithCash: json["payWithCash"],
      date: (json["date"] as Timestamp).toDate(),
      orderNumber: json["orderNumber"],
      orderStatusModel: OrderStatusModel.fromJson(json["orderStatusModel"]),
    );
  }

  MyOrderEntity toEntity() {
    return MyOrderEntity(
      payWithCash: payWithCash,
      products: products.map((ele) => ele.toEntity()).toList(),
      shippingAddressEntity: shippingAddressModel.toEntity(),
      uId: uId,
      date: date,
      orderNumber: orderNumber,
      orderStatusEntity: orderStatusModel.toEntity(),
      totalPrice: totalPrice,
    );
  }
}
