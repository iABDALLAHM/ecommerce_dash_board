import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    final productNames = cartItemEntity.productEntity.productName;
    final productName = context.locale.languageCode == "ar"
        ? productNames["productName_ar"]
        : productNames["productName_en"] ?? productNames["productName_ar"];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffFFFBEB),
        border: Border.all(color: Color(0xffFDE68A)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xffFDE68A)),
            ),
            child: ClipOval(
              child: Image.network(
                fit: BoxFit.cover,
                cartItemEntity.productEntity.productImage,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${LocaleKeys.orders_product_code.tr()}: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: cartItemEntity.productEntity.productCode,
                      style: AppStyles.textStyle13Bold,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${LocaleKeys.orders_product_name.tr()}: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: productName,
                      style: AppStyles.textStyle13Bold,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${LocaleKeys.orders_product_price.tr()}: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: cartItemEntity.productEntity.productPrice
                          .toString(),
                      style: AppStyles.textStyle13Bold,
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${LocaleKeys.orders_product_quantity.tr()}: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: cartItemEntity.quantity.toString(),
                      style: AppStyles.textStyle13Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListOfOrders extends StatelessWidget {
  const ListOfOrders({super.key, required this.items});
  final List<CartItemEntity> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OrderDetailsCard(cartItemEntity: items[index]),
        ),
      ),
    );
  }
}
