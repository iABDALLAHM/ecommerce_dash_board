import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/core/repositories/user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({
    required UserRepository userRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _userRepository = userRepository,
       _secureStorageRepository = secureStorageRepository,
       super(InitialGetUserDataState());

  final UserRepository _userRepository;
  final SecureStorageRepository _secureStorageRepository;

  Future<void> getUserData() async {
    emit(LoadingGetUserDataState());

    var userId = await _secureStorageRepository.getData(key: kUserId);

    var result = await _userRepository.getUserData(uId: userId);

    result.fold(
      (failure) {
        emit(FailureGetUserDataState(errorMessage: failure.errorMessage));
      },
      (result) {
        emit(SuccessGetUserDataState(userEntity: result));
      },
    );
  }
}
