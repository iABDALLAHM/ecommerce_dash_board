import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_states.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_orders_and_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersViewBlocListener extends StatelessWidget {
  const OrdersViewBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeOrderStatusCubit, ChangeOrderStatusStates>(
      listener: (context, state) {
        if (state is AcceptedOrderStatusState) {
          showSnackBar(context, message: "OrderAccepted");
          context.read<GetOrdersAndUserDataCubit>().getOrdersAndUserData();
        } else if (state is ShippedOrderStatusState) {
          showSnackBar(context, message: "OrderShipped");
          context.read<GetOrdersAndUserDataCubit>().getOrdersAndUserData();
        } else if (state is OutOfDeliveryOrderStatusState) {
          showSnackBar(context, message: "OrderOutOfDeliverd");
          context.read<GetOrdersAndUserDataCubit>().getOrdersAndUserData();
        } else if (state is OrderDeliverdStatusState) {
          showSnackBar(context, message: "OrderDeliverd");
          context.read<GetOrdersAndUserDataCubit>().getOrdersAndUserData();
        }
      },
      child: child,
    );
  }
}
