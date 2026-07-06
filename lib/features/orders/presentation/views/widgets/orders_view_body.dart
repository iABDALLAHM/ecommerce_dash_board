import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/CUBITS/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  @override
  void initState() {
    context.read<GetOrdersCubit>().getAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: OrdersListViewBlocBuilder(),
    );
  }
}
