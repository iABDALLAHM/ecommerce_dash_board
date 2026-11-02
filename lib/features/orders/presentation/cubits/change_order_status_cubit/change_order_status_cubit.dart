import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/core/services/notification_sender_service/notification_sender_service.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeOrderStatusCubit extends Cubit<ChangeOrderStatusStates> {
  ChangeOrderStatusCubit({required OrderRepository orderRepository})
    : _orderRepository = orderRepository,
      super(InitialOrderStatusState());

  final OrderRepository _orderRepository;

  Future<void> acceptOrder({required OrderEntity orderEntity}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.acceptOrder": true,
        "orderStatusModel.acceptedAt": DateTime.now(),
      },
      orderNumber: orderEntity.orderNumber,
    );
    await getIt<NotificationSenderService>().sendOrderStatusNotification(
      fcmToken: orderEntity.fcmToken,
      orderId: orderEntity.orderNumber,
      newStatus: "processing",
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(AcceptedOrderStatusState()),
    );
  }

  Future<void> shippedOrder({required OrderEntity orderEntity}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.orderShipped": true,
        "orderStatusModel.shippedAt": DateTime.now(),
      },
      orderNumber: orderEntity.orderNumber,
    );
    await getIt<NotificationSenderService>().sendOrderStatusNotification(
      fcmToken: orderEntity.fcmToken,
      orderId: orderEntity.orderNumber,
      newStatus: "shipping",
    );

    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(ShippedOrderStatusState()),
    );
  }

  Future<void> outOfDelivery({required OrderEntity orderEntity}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.outOfDelivery": true,
        "orderStatusModel.outOfDeliveryAt": DateTime.now(),
      },
      orderNumber: orderEntity.orderNumber,
    );
    await getIt<NotificationSenderService>().sendOrderStatusNotification(
      fcmToken: orderEntity.fcmToken,
      orderId: orderEntity.orderNumber,
      newStatus: "shipping",
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(OutOfDeliveryOrderStatusState()),
    );
  }

  Future<void> deliverdOrder({required OrderEntity orderEntity}) async {
    emit(LoadingOrderStatusState());
    var result = await _orderRepository.changeOrderStatus(
      data: {
        "orderStatusModel.orderDelivered": true,
        "orderStatusModel.deliverdAt": DateTime.now(),
      },
      orderNumber: orderEntity.orderNumber,
    );
    await getIt<NotificationSenderService>().sendOrderStatusNotification(
      fcmToken: orderEntity.fcmToken,
      orderId: orderEntity.orderNumber,
      newStatus: "delivered",
    );
    result.fold(
      (failure) =>
          emit(FailureOrderStatusState(errorMessage: failure.errorMessage)),
      (result) => emit(OrderDeliverdStatusState()),
    );
  }
}
