abstract class ChangeOrderStatusStates {}

final class InitialOrderStatusState extends ChangeOrderStatusStates {}

final class LoadingOrderStatusState extends ChangeOrderStatusStates {}

final class FailureOrderStatusState extends ChangeOrderStatusStates {
  final String errorMessage;

  FailureOrderStatusState({required this.errorMessage});
}

final class AcceptedOrderStatusState extends ChangeOrderStatusStates {}

final class ShippedOrderStatusState extends ChangeOrderStatusStates {}

final class OutOfDeliveryOrderStatusState extends ChangeOrderStatusStates {}

final class OrderDeliverdStatusState extends ChangeOrderStatusStates {}
