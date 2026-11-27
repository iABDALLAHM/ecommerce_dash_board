import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardBlocListener extends StatelessWidget {
  const DashboardBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutStates>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          context.pop();
          context.go(AppRoutes.login);
          showSnackBar(
            context,
            message: LocaleKeys.dashboard_messages_signOutSuccess.tr(
              context: context
            ),
          );
        }
      },
      child: child,
    );
  }
}
