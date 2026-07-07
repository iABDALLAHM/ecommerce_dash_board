import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusBlocListener extends StatelessWidget {
  const OrderStatusBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeOrderStatusCubit, ChangeOrderStatusStates>(
      listener: (context, state) {
        if (state is AcceptedOrderStatusState) {
          showSnackBar(context, message: "OrderAccepted");
        } else if (state is ShippedOrderStatusState) {
          showSnackBar(context, message: "OrderShipped");
        } else if (state is OutOfDeliveryOrderStatusState) {
          showSnackBar(context, message: "OrderOutOfDeliverd");
        } else if (state is OrderDeliverdStatusState) {
          showSnackBar(context, message: "OrderDeliverd");
        }
      },
      child: child,
    );
  }
}
