import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/user_entity/user_entity.dart';

class OrderAndUserEntity {
  final OrderEntity orderEntity;
  final UserEntity userEntity;

  OrderAndUserEntity({required this.orderEntity, required this.userEntity});
}
