import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:flutter/material.dart';

class CustomAddressDetailsWidget extends StatelessWidget {
  const CustomAddressDetailsWidget({
    super.key,
    required this.orderAndUserEntity,
  });

  final OrderAndUserEntity orderAndUserEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffEFF8FE)),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تفاصيل العنوان: ",
                    style: AppStyles.textStyle13Bold.copyWith(
                      color: Color(0xff1D4ED8),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "العنوان: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.address} ",
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
                          text: "رقم الشقة: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.addressDetails} ",
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
                          text: "المدينة: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.city} ",
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
                          text: "الإيميل: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.email} ",
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
                          text: "الإسم: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.name} ",
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
                          text: "الرقم: ",
                          style: AppStyles.textStyle13Bold,
                        ),
                        TextSpan(
                          text:
                              "${orderAndUserEntity.orderEntity.shippingAddressEntity.phone} ",
                          style: TextStyle(color: Color(0xff64748B)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
