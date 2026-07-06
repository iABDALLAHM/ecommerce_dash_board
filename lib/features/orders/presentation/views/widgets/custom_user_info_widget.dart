import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:flutter/material.dart';

class CustomUserInfoWidget extends StatelessWidget {
  const CustomUserInfoWidget({super.key, required this.orderAndUserEntity});

  final OrderAndUserEntity orderAndUserEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Color(0xffF1F5F9)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الأوردر من: ",
                    style: AppStyles.textStyle13Bold.copyWith(
                      color: Color(0xff565E74),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "الإسم: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text: "${orderAndUserEntity.userEntity.name} ",
                          style: TextStyle(color: Color(0xff64748B)),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "الإيميل: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              " ${orderAndUserEntity.userEntity.email} ",
                          style: TextStyle(color: Color(0xff64748B)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          ClipOval(
            child: Image.network(
              fit: BoxFit.cover,
             orderAndUserEntity.userEntity.userImage,
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
