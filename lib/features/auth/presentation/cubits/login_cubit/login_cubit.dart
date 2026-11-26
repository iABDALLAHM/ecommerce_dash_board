import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/core/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({
    required this.authRepository,
    required this.secureStorageRepository,
  }) : super(LoginInitialState());

  final AuthRepository authRepository;
  final SecureStorageRepository secureStorageRepository;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await authRepository.signIn(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailureState(errorMessage: failure.errorMessage)),
      (data) async {
        await secureStorageRepository.saveData(key: kUserId, value: data.uId);
        emit(LoginSuccessState(userEntity: data));
      },
    );
  }
}
