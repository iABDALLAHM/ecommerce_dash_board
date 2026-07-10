import 'dart:async';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/orders.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_stream_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStreamOrdersCubit extends Cubit<GetStreamOrdersStates> {
  GetStreamOrdersCubit({required this.orderRepository})
    : super(LoadingGetOrdersState()) {
    streamSubscription = orderRepository.getStreamOrders().listen((orders) {
      monitorOrders(orders: orders);
    });
  }

  void monitorOrders({required List<OrderAndUserEntity> orders}) {
    if (orders.isEmpty) {
      emit(EmptyOrdersState());
    } else {
      emit(SuccessGetOrdersState(orders: orders));
    }
  }

  final OrderRepository orderRepository;
  late StreamSubscription streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
