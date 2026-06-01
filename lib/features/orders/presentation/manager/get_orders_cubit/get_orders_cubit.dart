import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/manager/get_orders_cubit/get_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersCubit extends Cubit<GetOrdersStates> {
  GetOrdersCubit({required this.ordersRepo}) : super(LoadingGetOrdersState());

  final OrdersRepo ordersRepo;

  Future fetchOrders() async {
    var result = await ordersRepo.getOrders();
    result.fold(
      (failure) {
        emit(FailureGetOrdersState(errorMessage: failure.errorMessage));
      },
      (orders) {
        if (orders.isEmpty) {
          emit(EmptyOrdersState());
        } else {
          emit(SuccessGetOrdersState(orders: orders));
        }
      },
    );
  }
}
