import 'package:ecommerce_dash_board/core/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutCubit extends Cubit<SignOutStates> {
  SignOutCubit({
    required this.authRepository,
    required this.secureStorageRepository,
  }) : super(SignOutInitialState());

  final AuthRepository authRepository;
  final SecureStorageRepository secureStorageRepository;

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    var result = await authRepository.signOut();
    result.fold((failure) => emit(SignOutFailureState()), (success) async {
      await secureStorageRepository.clearAll();
      emit(SignOutSuccessState());
    });
  }
}
