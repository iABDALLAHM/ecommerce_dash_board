import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_stream_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrdersBlocProvider extends StatelessWidget {
  const GetOrdersBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetStreamOrdersCubit(
            orderRepository: getIt.get<OrderRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChangeOrderStatusCubit(
            orderRepository: getIt.get<OrderRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
