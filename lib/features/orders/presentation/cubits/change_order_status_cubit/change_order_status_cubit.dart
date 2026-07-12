import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeOrderStatusCubit extends Cubit<ChangeOrderStatusStates> {
  ChangeOrderStatusCubit({required OrderRepository orderRepository})
    : _orderRepository = orderRepository,
      super(InitialOrderStatusState());

  final OrderRepository _orderRepository;

  Future<void> acceptOrder({required String orderNumber}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.acceptOrder": true,
        "orderStatusModel.acceptedAt": DateTime.now(),
      },
      orderNumber: orderNumber,
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(AcceptedOrderStatusState()),
    );
  }

  Future<void> shippedOrder({required String orderNumber}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.orderShipped": true,
        "orderStatusModel.shippedAt": DateTime.now(),
      },
      orderNumber: orderNumber,
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(ShippedOrderStatusState()),
    );
  }

  Future<void> outOfDelivery({required String orderNumber}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.outOfDelivery": true,
        "orderStatusModel.outOfDeliveryAt": DateTime.now(),
      },
      orderNumber: orderNumber,
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(OutOfDeliveryOrderStatusState()),
    );
  }

  Future<void> deliverdOrder({required String orderNumber}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.orderDelivered": true,
        "orderStatusModel.deliverdAt": DateTime.now(),
      },
      orderNumber: orderNumber,
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(OrderDeliverdStatusState()),
    );
  }
}
