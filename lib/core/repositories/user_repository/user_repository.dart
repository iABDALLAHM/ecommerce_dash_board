import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> addUserData({required UserEntity userEntity});
  Future<Either<Failure, UserEntity>> getUserData({required String uId});
  Future<Either<Failure, void>> updateUserData({
    required UserEntity userEntity,
  });
}
