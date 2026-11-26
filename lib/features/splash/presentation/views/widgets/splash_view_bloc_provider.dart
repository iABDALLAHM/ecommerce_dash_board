import 'package:ecommerce_dash_board/core/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBlocProvider extends StatelessWidget {
  const SplashViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        authRepository: getIt<AuthRepository>(),
        secureStorageRepository: getIt<SecureStorageRepository>(),
      ),
      child: child,
    );
  }
}