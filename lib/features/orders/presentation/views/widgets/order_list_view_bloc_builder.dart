
import 'package:ecommerce_dash_board/features/orders/presentation/CUBITS/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/CUBITS/get_orders_cubit/get_orders_states.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListViewBlocBuilder extends StatelessWidget {
  const OrdersListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersStates>(
      builder: (context, state) {
        if (state is SuccessGetOrdersState) {
          return ListView.builder(
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return OrderItem(orderAndUserEntity: state.orders[index]);
            },
          );
        } else if (state is FailureGetOrdersState) {
          return Text(state.errorMessage);
        } else if (state is LoadingGetOrdersState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is EmptyOrdersState) {
          return Text("لا يوجد اي اوردارات في الوقت الحالي");
        }
        return SizedBox();
      },
    );
  }
}
