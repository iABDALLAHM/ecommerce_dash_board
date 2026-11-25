import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/get_orders_cubit/get_orders_states.dart';
import 'package:ecommerce_dash_board/features/orders/orders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersCubit extends Cubit<GetOrdersStates> {
  GetOrdersCubit({required OrderRepository orderRepository})
    : _orderRepository = orderRepository,
      super(GetOrdersInitialState());

  final OrderRepository _orderRepository;

  Future<void> getOrders() async {
    emit(GetOrdersLoadingState());
    var result = await _orderRepository.getOrders();
    result.fold(
      (faliure) =>
          emit(GetOrdersFailureState(errorMessage: faliure.errorMessage)),
      (orders) {
        final now = DateTime.now();
        final todayOrders = orders.where((order) {
          return order.date.year == now.year &&
              order.date.month == now.month &&
              order.date.day == now.day;
        }).toList();

        emit(
          GetOrdersSuccessState(allOrders: orders, todayOrders: todayOrders),
        );
      },
    );
  }
}
