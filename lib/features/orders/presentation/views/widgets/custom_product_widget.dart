import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/product_item_entity.dart/product_item_entity.dart';
import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({
    super.key,
    required this.myOrderEntity,
    required this.index,
  });
  final ProductItemEntity myOrderEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "المطلوب $index",
              style: AppStyles.textStyle13Bold.copyWith(
                color: Color(0xff78350F),
              ),
            ),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "كود المنتج: ",
                    style: AppStyles.textStyle13Bold,
                  ),
                  TextSpan(
                    text: "${myOrderEntity.code} ",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 3),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "اسم المنتج: ",
                    style: AppStyles.textStyle13Bold,
                  ),
                  TextSpan(
                    text: "${myOrderEntity.name} ",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 3),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "سعر المنتج: ",
                    style: AppStyles.textStyle13Bold,
                  ),
                  TextSpan(
                    text: "${myOrderEntity.price} ",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 3),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "كمية المنتج: ",
                    style: AppStyles.textStyle13Bold,
                  ),
                  TextSpan(
                    text: "${myOrderEntity.quantity} ",
                    style: TextStyle(color: Color(0xff64748B)),
                  ),
                ],
              ),
            ),
          ],
        ),

        Spacer(),
        ClipOval(
          child: Image.network(
            fit: BoxFit.cover,
            myOrderEntity.imageUrl,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
