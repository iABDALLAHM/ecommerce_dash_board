import 'package:ecommerce_dash_board/features/orders/orders.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/CUBITS/get_orders_cubit/get_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersCubit extends Cubit<GetOrdersStates> {
  GetOrdersCubit({required this.orderRepository}) : super(InitialGetOrdersState());

  final OrderRepository orderRepository;

  Future getAllOrders() async {
    emit(LoadingGetOrdersState());
    var result = await orderRepository.getOrders();

    result.fold(
      (failure) {
        emit(FailureGetOrdersState(errorMessage: failure.errorMessage));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyOrdersState());
        } else {
          emit(SuccessGetOrdersState(orders: result));
        }
      },
    );
  }
}
