import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, OrderEntity>> getOrders();
}
