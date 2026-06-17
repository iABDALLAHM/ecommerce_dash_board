import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/get_orders_bloc_provider.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetOrdersBlocProvider(
      child: Scaffold(appBar: buildAppBar(context), body: OrdersViewBody()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text("Orders", style: AppStyles.textStyle23Bold),
    );
  }
}
