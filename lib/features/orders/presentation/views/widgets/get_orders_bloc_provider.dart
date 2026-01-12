import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersBlocProvider extends StatelessWidget {
  const GetOrdersBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(ordersRepo: getIt.get<OrdersRepo>()),
      child: child,
    );
  }
}
