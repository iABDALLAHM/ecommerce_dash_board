import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/models/user_model/user_model.dart';
import 'package:ecommerce_dash_board/core/repositories/user_repository/user_repository.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImplementation implements UserRepository {
  final DatabaseService databaseService;

  UserRepositoryImplementation({required this.databaseService});

  @override
  Future<Either<Failure, void>> addUserData({
    required UserEntity userEntity,
  }) async {
    try {
      await databaseService.addSingleData(
        path: BackendEndPoints.usersCollection,
        data: UserModel.fromEntity(userEntity).toMap(),
        documentId: userEntity.uId,
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in addUserData the error : $e",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData({required String uId}) async {
    try {
      var userMap = await databaseService.getSingleData(
        path: BackendEndPoints.usersCollection,
        documentId: uId,
      );

      UserEntity user = UserModel.fromJson(userMap).toEntity();
      return Right(user);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in getUserData the error : $e",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserData({
    required UserEntity userEntity,
  }) async {
    try {
      await databaseService.updateData(
        data: UserModel.fromEntity(userEntity).toMap(),
        path: BackendEndPoints.usersCollection,
        documentId: userEntity.uId,
      );

      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in UserRepoImplementation in updateUserData the error : $e",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
