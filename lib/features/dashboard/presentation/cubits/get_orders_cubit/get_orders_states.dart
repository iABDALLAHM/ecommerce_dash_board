import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';

abstract class GetOrdersStates {}

final class GetOrdersSuccessState extends GetOrdersStates {
  final List<OrderEntity> allOrders;
  final List<OrderEntity> todayOrders;

  GetOrdersSuccessState({required this.allOrders, required this.todayOrders});
}

final class GetOrdersInitialState extends GetOrdersStates {}

final class GetOrdersFailureState extends GetOrdersStates {
  final String errorMessage;

  GetOrdersFailureState({required this.errorMessage});
}

final class GetOrdersLoadingState extends GetOrdersStates {}
