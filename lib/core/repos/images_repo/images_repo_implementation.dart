import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/repos/images_repo/images_repo.dart';

class ImagesRepoImplementation implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage() {
    throw UnimplementedError();
  }
}
