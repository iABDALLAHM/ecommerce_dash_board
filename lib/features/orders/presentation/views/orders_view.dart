import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = "orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text("Orders", style: AppStyles.textStyle23Bold),
      ),
      body: BlocProvider(
        create: (context) =>
            GetOrdersCubit(ordersRepo: getIt.get<OrdersRepo>()),
        child: OrdersViewBody(),
      ),
    );
  }
}
