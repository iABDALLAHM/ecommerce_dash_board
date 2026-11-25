
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_stream_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_stream_orders_states.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStreamOrdersCubit, GetStreamOrdersStates>(
      builder: (context, state) {
        if (state is SuccessGetOrdersState) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: state.orders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
                child: OrderCard(orderAndUserEntity: state.orders[index]),
              );
            },
          );
        } else if (state is LoadingGetOrdersState) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xff059669)),
          );
        }
        return Center(
          child: Text("لا يوجد منتجات", style: AppStyles.textStyle16Bold),
        );
      },
    );
  }
}
