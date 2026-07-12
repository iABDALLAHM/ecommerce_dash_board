import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_dash_board/core/services/storage_service/storage_service.dart';

class ImagesRepositoryImplementation implements ImagesRepository {
  final StorageService storageService;

  ImagesRepositoryImplementation({required this.storageService});

  @override
  Future<Either<Failure, String>> uploadImage({
    required File file,
    required String path,
  }) async {
    try {
      String imageUrl = await storageService.uploadFile(file: file, path: path);
      return Right(imageUrl);
    } on CustomException catch (e) {
      log("error happend in ImagesRepoImplementation in uploadImage $e");
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
