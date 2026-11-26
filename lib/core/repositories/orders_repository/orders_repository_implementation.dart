import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/models/query_prams.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_model/order_model.dart';
import 'package:ecommerce_dash_board/core/models/user_model/user_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_dash_board/core/repositories/orders_repository/orders_repository.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
class OrdersRepositoryImplementation implements OrderRepository {
  final DatabaseService databaseService;

  OrdersRepositoryImplementation({required this.databaseService});

  @override
  Future<Either<Failure, List<OrderAndUserEntity>>>
  getOrdersAndUserData() async {
    try {
      var result = await databaseService.getData(
        path: BackendEndPoints.ordersCollection,
      );
      List<OrderAndUserEntity> listOfOrders = [];

      for (var orderJson in result) {
        OrderEntity order = OrderModel.fromJson(orderJson).toEntity();

        var userData = await databaseService.getSingleData(
          path: BackendEndPoints.usersCollection,
          documentId: order.uId,
        );

        UserEntity user = UserModel.fromJson(userData).toEntity();

        listOfOrders.add(
          OrderAndUserEntity(orderEntity: order, userEntity: user),
        );
      }
      return Right(listOfOrders);
    } on CustomException catch (e) {
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, void>> changeOrderStatus({
    required Map<String, dynamic> data,
    required String orderNumber,
  }) async {
    try {
      var result = await databaseService.getDocumentId(
        path: BackendEndPoints.ordersCollection,
        query: QueryParams(
          condition: QueryCondition(
            field: "orderNumber",
            isEqualTo: orderNumber,
          ),
        ),
      );

      await databaseService.updateData(
        path: BackendEndPoints.ordersCollection,
        documentId: result,
        data: data,
      );

      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in OrdersRepoImplementation in changeOrderStatus method",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoints.ordersCollection,
      );
      List<OrderEntity> ordersList = [];

      for (var order in data) {
        ordersList.add(OrderModel.fromJson(order).toEntity());
      }
      return Right(ordersList);
    } on CustomException catch (e) {
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
