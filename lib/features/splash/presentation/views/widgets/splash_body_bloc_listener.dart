import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/cubits/splash_cubit/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashBodyBlocListener extends StatelessWidget {
  const SplashBodyBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashStates>(
      listener: (context, state) {
        if (state is NavigateToDashboardScreen) {
          context.go(AppRoutes.dashboard);
        } else if (state is NavigateToLoginScreen) {
          context.go(AppRoutes.login);
        }
      },
      child: child,
    );
  }
}
