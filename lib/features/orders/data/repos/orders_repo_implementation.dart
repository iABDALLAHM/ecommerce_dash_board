import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/order_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImplementation implements OrdersRepo {
  final DatabaseService databaseService;
  OrdersRepoImplementation({required this.databaseService});
  @override
  Future<Either<Failure, OrderEntity>> getOrders() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoints.getProducts,
      );
      OrderEntity orderEntity = OrderModel.fromJson(data).toEntity();
      return Right(orderEntity);
    } catch (e) {
      return Left(ServerFailure(errorMessage: "حدث خطأ"));
    }
  }
}
