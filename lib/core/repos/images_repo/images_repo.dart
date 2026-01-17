import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage({required File file,required String path});
}
