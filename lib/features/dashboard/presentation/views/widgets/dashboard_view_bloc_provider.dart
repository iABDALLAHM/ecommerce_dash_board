import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DashboardViewBlocProvider extends StatelessWidget {
  const DashboardViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetOrdersCubit>()..getOrders()),
        BlocProvider(create: (context) => getIt<SignOutCubit>()),
      ],
      child: child,
    );
  }
}
