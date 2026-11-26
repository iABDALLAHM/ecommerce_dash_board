import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/core/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/cubits/splash_cubit/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashStates> {
  SplashCubit({
    required this.authRepository,
    required this.secureStorageRepository,
  }) : super(SplashInitialState());

  final SecureStorageRepository secureStorageRepository;
  final AuthRepository authRepository;

  Future<void> checkUserStates() async {
    await Future.delayed(Duration(seconds: 3));
    var result = await authRepository.getCurrentUserId();
    result.fold(
      (failure) {
        emit(NavigateToLoginScreen());
      },
      (data) async {
        var currentUserId = await secureStorageRepository.getData(key: kUserId);
        if (currentUserId == data) {
          emit(NavigateToDashboardScreen());
        } else {
          emit(NavigateToLoginScreen());
        }
      },
    );
  }
}
