import 'package:ecommerce_dash_board/features/orders/orders.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_orders_and_user_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersAndUserDataCubit extends Cubit<GetOrdersAndUserDataStates> {
  GetOrdersAndUserDataCubit({required this.orderRepository})
    : super(GetOrdersAndUserDataInitialState());

  final OrderRepository orderRepository;

  Future<void> getOrdersAndUserData() async {
    emit(GetOrdersAndUserDataLoadingState());
    var result = await orderRepository.getOrdersAndUserData();
    result.fold(
      (failure) => emit(
        GetOrdersAndUserDataFailureState(errorMessage: failure.errorMessage),
      ),
      (data) {
        emit(GetOrdersAndUserDataSuccessState(ordersAndUserData: data));
      },
    );
  }
}
