import 'package:ecommerce_dash_board/features/orders/data/models/order_product_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/shipping_address_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json["totalPrice"],
      uId: json["uId"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json["shippingAddressModel"],
      ),
      orderProducts: (json["orderProducts"] as List<dynamic>)
          .map((ele) => OrderProductModel.fromJson(ele))
          .toList(),
      paymentMethod: json["paymentMethod"],
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uId: uId,
      shippingAddressModel: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((ele) => ele.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }
}
