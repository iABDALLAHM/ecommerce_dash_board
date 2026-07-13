import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/core/models/query_prams.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_model/order_model.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/user_model/user_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/my_order_entity/my_order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/user_entity/user_entity.dart';

class OrdersRepositoryImplementation implements OrderRepository {
  final DatabaseService databaseService;

  OrdersRepositoryImplementation({required this.databaseService});

  @override
  Stream<List<OrderAndUserEntity>> getStreamOrders() {
    return databaseService
        .getStreamData(path: BackendEndPoints.ordersCollection)
        .asyncMap((ordersList) async {
          List<OrderAndUserEntity> result = [];

          for (var orderJson in ordersList) {
            MyOrderEntity order = OrderModel.fromJson(orderJson).toEntity();

            var userData = await databaseService.getSingleData(
              path: BackendEndPoints.usersCollection,
              documentId: order.uId,
            );

            UserEntity user = UserModel.fromJson(userData).toEntity();

            result.add(
              OrderAndUserEntity(myOrderEntity: order, userEntity: user),
            );
          }
          return result;
        });
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
}
