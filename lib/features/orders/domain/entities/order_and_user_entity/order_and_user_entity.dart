import 'package:ecommerce_dash_board/features/orders/domain/entities/my_order_entity/my_order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/user_entity/user_entity.dart';

class OrderAndUserEntity {
  final MyOrderEntity myOrderEntity;
  final UserEntity userEntity;

  OrderAndUserEntity({required this.myOrderEntity, required this.userEntity});
}
