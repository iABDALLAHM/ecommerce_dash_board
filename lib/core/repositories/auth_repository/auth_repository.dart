import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, String?>> getCurrentUserId();
}
