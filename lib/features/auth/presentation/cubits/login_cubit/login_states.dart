import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';

abstract class LoginStates {}

final class LoginInitialState extends LoginStates {}

final class LoginSuccessState extends LoginStates {
  final UserEntity userEntity;

  LoginSuccessState({required this.userEntity});
}

final class LoginFailureState extends LoginStates {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

final class LoginLoadingState extends LoginStates {}
