import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/models/user_model/user_model.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/auth/data/services/auth_service/auth_service.dart';
import 'package:ecommerce_dash_board/core/repositories/auth_repository/auth_repository.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImplementation implements AuthRepository {
  final AuthService authService;
  final DatabaseService databaseService;
  AuthRepositoryImplementation({
    required this.authService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authService.signIn(email: email, password: password);
      var result = await databaseService.checkUserData(
        documentId: user.uid,
        path: BackendEndPoints.adminsCollection,
      );
      if (result == null) {
        return Left(
          ServerFailure(errorMessage: LocaleKeys.login_messages_unauthorized),
        );
      }
      UserEntity userEntity = UserModel.fromJson(result).toEntity();
      return Right(userEntity);
    } on CustomException catch (e) {
      log("error happend in AuthRepoImplementation in signIn the error : $e");
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authService.signOut();
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in AuthRepoImplementation in signOut the error : ${e.exceptionMeassge}",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, String?>> getCurrentUserId() async {
    try {
      var result = await authService.getCurrentUserId();
      return Right(result);
    } on CustomException catch (e) {
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
