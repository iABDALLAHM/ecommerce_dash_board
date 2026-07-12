import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';

abstract class OrderRepository {
  Stream<List<OrderAndUserEntity>> getStreamOrders();
  Future<Either<Failure, void>> changeOrderStatus({
    required Map<String, dynamic> data,
    required String orderNumber,
  });
}
