import 'package:ecommerce_dash_board/core/function/get_specific_date.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/custom_address_details_widget.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/custom_product_details_widget.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/custom_user_info_widget.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_status_options.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/see_less_widget.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/see_more_widget.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.orderAndUserEntity});
  final OrderAndUserEntity orderAndUserEntity;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool seeMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: .555,
            blurRadius: 6,
            offset: Offset(0, 1),
            color: Colors.grey,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrderStatusOptions(orderAndUserEntity: widget.orderAndUserEntity),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "الرقم الخاص بالمستخدم:  ",
                  style: AppStyles.textStyle13Bold,
                ),
              ],
            ),
          ),

          Text(
            "${widget.orderAndUserEntity.userEntity.uId} ",
            maxLines: 3,
            style: TextStyle(color: Color(0xff64748B)),
          ),

          const SizedBox(height: 10),
          CustomUserInfoWidget(orderAndUserEntity: widget.orderAndUserEntity),
          const SizedBox(height: 10),

          Text(
            "رقم الأوردر: ${widget.orderAndUserEntity.orderEntity.orderNumber}",
            style: AppStyles.textStyle13Bold,
          ),
          const SizedBox(height: 10),
          Text(
            "السعر الكلي: ${widget.orderAndUserEntity.orderEntity.totalPrice.round()}",
            style: AppStyles.textStyle13Bold,
          ),
          const SizedBox(height: 10),
          Text(
            "الدفع كاش: ${widget.orderAndUserEntity.orderEntity.payWithCash}",
            style: AppStyles.textStyle13Bold,
          ),
          const SizedBox(height: 10),
          Text(
            "تاريخ الأوردر: ${getSpecificDate(date: widget.orderAndUserEntity.orderEntity.date)}",
            style: AppStyles.textStyle13Bold,
          ),
          const SizedBox(height: 10),

          seeMore == true
              ? Column(
                  children: [
                    CustomAddressDetailsWidget(
                      orderAndUserEntity: widget.orderAndUserEntity,
                    ),

                    CustomProductDetailsWidget(
                      orderAndUserEntity: widget.orderAndUserEntity,
                    ),
                    GestureDetector(
                      onTap: () {
                        seeMore = false;
                        setState(() {});
                      },
                      child: SeeLessWidget(),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () {
                    seeMore = true;
                    setState(() {});
                  },
                  child: SeeMoreWidget(),
                ),
        ],
      ),
    );
  }
}
