import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';

class CustomProductDetailsWidget extends StatelessWidget {
  const CustomProductDetailsWidget({
    super.key,
    required this.orderAndUserEntity,
  });

  final OrderAndUserEntity orderAndUserEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFAE9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  orderAndUserEntity.orderEntity.cartEntity.items.length,
                  (index) => CustomProductWidget(
                    index: index + 1,
                    cartItemEntity:
                        orderAndUserEntity.orderEntity.cartEntity.items[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
