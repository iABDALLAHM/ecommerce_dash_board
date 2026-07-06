import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_model/order_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/user_model/user_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/my_order_entity/my_order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';
import 'package:ecommerce_dash_board/features/orders/domain/user_entities/user_entity.dart';

class OrdersRepoImplementation implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImplementation({required this.databaseService});

  @override
  Future<Either<Failure, List<OrderAndUserEntity>>> getOrders() async {
    try {
      var result = await databaseService.getData(
        path: BackendEndPoints.getOrders,
      );

      List<OrderAndUserEntity> orderAndUserEntityList = [];

      for (var order in result) {
        MyOrderEntity orderEntity = OrderModel.fromJson(order).toEntity();

        var userData = await databaseService.getSingleData(
          path: BackendEndPoints.addUserData,
          documentId: orderEntity.uId,
        );

        UserEntity userEntity = UserModel.fromJson(userData).toEntity();

        orderAndUserEntityList.add(
          OrderAndUserEntity(
            myOrderEntity: orderEntity,
            userEntity: userEntity,
          ),
        );
      }
      return Right(orderAndUserEntityList);
    } on CustomException catch (e) {
      log("error happend in OrdersRepoImplementation in getOrders method");
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
