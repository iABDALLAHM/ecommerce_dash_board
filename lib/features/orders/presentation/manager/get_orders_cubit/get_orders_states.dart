import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';

abstract class GetOrdersStates {}

final class InitialGetOrdersState extends GetOrdersStates {}

final class LoadingGetOrdersState extends GetOrdersStates {}

final class SuccessGetOrdersState extends GetOrdersStates {
  final List<OrderEntity> orders;
  SuccessGetOrdersState({required this.orders});
}

final class FailureGetOrdersState extends GetOrdersStates {
  final String errorMessage;
  FailureGetOrdersState({required this.errorMessage});
}
