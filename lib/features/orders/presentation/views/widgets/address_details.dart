
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/shipping_address_entity/shipping_address_entity.dart';
import 'package:flutter/material.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key, required this.shippingAddressEntity});
  final ShippingAddressEntity shippingAddressEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffEFF6FF),
        border: Border.all(color: Color(0xffDBEAFE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_rounded, color: Color(0xff1D4ED8)),
              const SizedBox(width: 5),
              Text(
                "تفاصيل العنوان:",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: Color(0xff1D4ED8),
                ),
              ),
            ],
          ),
          Divider(color: Color(0xffDBEAFE), indent: 10, endIndent: 10),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "العنوان: ",
                  style: AppStyles.textStyle13Regular.copyWith(
                    color: Color(0xff64748B),
                  ),
                ),
                TextSpan(
                  text: shippingAddressEntity.address,
                  style: AppStyles.textStyle13Regular,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "رقم الشقة: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),

                    TextSpan(
                      text: shippingAddressEntity.addressDetails,
                      style: AppStyles.textStyle13Regular,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "المدينة: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: shippingAddressEntity.city,
                      style: AppStyles.textStyle13Regular,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: Color(0xffDBEAFE), indent: 10, endIndent: 10),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "المستلم: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: shippingAddressEntity.name,
                      style: AppStyles.textStyle13Bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "الرقم: ",
                      style: AppStyles.textStyle13Regular.copyWith(
                        color: Color(0xff64748B),
                      ),
                    ),
                    TextSpan(
                      text: shippingAddressEntity.phone,
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


