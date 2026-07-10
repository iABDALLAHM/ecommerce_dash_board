import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';

abstract class GetStreamOrdersStates {}

final class SuccessGetOrdersState extends GetStreamOrdersStates {
  final List<OrderAndUserEntity> orders;

  SuccessGetOrdersState({required this.orders});
}

final class LoadingGetOrdersState extends GetStreamOrdersStates {}

final class EmptyOrdersState extends GetStreamOrdersStates {}
