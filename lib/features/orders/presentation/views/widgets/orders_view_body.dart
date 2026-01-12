import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/manager/get_orders_cubit/get_orders_states.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_item.dart';

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
    context.read<GetOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 25),
                FilterSection(),
                BlocBuilder<GetOrdersCubit, GetOrdersStates>(
                  builder: (context, state) {
                    if (state is SuccessGetOrdersState) {
                      return OrderItem(order: state.orders[0]);
                    } else if (state is FailureGetOrdersState) {
                      return Text(state.errorMessage);
                    } else {
                      return Text("جاري التحميل");
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
