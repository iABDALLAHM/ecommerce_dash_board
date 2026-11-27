import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_dark_mode_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_language_button.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_card.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_header.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.go(AppRoutes.dashboard);
          showSnackBar(
            context,
            message: LocaleKeys.login_messages_success.tr(),
          );
        } else if (state is LoginFailureState) {
          showSnackBar(context, message: state.errorMessage.tr());
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CustomLanguageButton(), CustomDarkModeButton()],
                ),
                const SizedBox(height: 20),
                LoginHeader(),
                const SizedBox(height: 24),
                LoginCard(),
              ],
            ),
          ),
        );
      },
    );
  }
}
