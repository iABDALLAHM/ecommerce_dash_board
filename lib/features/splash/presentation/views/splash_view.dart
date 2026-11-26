import 'package:ecommerce_dash_board/features/splash/presentation/views/widgets/splash_body.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/views/widgets/splash_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashViewBlocProvider(child: Scaffold(body: SplashBody()));
  }
}
