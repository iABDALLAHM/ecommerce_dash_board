import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/get_orders_bloc_provider.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_body.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_view_bloc_listener.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetOrdersBlocProvider(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: OrdersViewBlocListener(child: OrdersBody()),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: CustomArrowBack(),
      centerTitle: true,
      title: Text("الأوردرات", style: AppStyles.textStyle23Bold),
    );
  }
}
