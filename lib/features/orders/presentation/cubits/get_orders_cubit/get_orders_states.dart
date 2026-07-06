import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';

abstract class GetOrdersStates {}

final class SuccessGetOrdersState extends GetOrdersStates {
  final List<OrderAndUserEntity> orders;

  SuccessGetOrdersState({required this.orders});
}

final class FailureGetOrdersState extends GetOrdersStates {
  final String errorMessage;

  FailureGetOrdersState({required this.errorMessage});
}

final class LoadingGetOrdersState extends GetOrdersStates {}

final class EmptyOrdersState extends GetOrdersStates {}


final class InitialGetOrdersState extends GetOrdersStates {}
