import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_body.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginViewBlocProvider(
      child: Scaffold(body: SafeArea(child: LoginBody())),
    );
  }
}
