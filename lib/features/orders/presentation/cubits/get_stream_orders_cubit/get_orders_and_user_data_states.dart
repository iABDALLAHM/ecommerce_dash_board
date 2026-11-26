import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';

abstract class GetOrdersAndUserDataStates {}

final class GetOrdersAndUserDataSuccessState
    extends GetOrdersAndUserDataStates {
  final List<OrderAndUserEntity> ordersAndUserData;

  GetOrdersAndUserDataSuccessState({required this.ordersAndUserData});
}

final class GetOrdersAndUserDataLoadingState
    extends GetOrdersAndUserDataStates {}

final class GetOrdersAndUserDataFailureState
    extends GetOrdersAndUserDataStates {
  final String errorMessage;

  GetOrdersAndUserDataFailureState({required this.errorMessage});
}

final class GetOrdersAndUserDataInitialState
    extends GetOrdersAndUserDataStates {}
