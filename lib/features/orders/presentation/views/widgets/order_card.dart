import 'package:ecommerce_dash_board/core/function/get_specific_date.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/address_details.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_details.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_details_card.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_status_selector.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_user_details.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.orderAndUserEntity});
  final OrderAndUserEntity orderAndUserEntity;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool seeMore = false;
  late String currentStatus;

  @override
  void initState() {
    currentStatus = widget.orderAndUserEntity.orderEntity.currentStatusText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2E8F0), width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                LocaleKeys.orders_statusLabel.tr(),
                style: AppStyles.textStyle13Bold.copyWith(
                  color: Color(0xff64748B),
                ),
              ),
              const Spacer(),
              OrderStatusSelector(
                orderEntity: widget.orderAndUserEntity.orderEntity,
                currentStatus: currentStatus,
                onStatusChanged: (value) {
                  currentStatus = value;
                  setState(() {});
                },
              ),
            ],
          ),
          Divider(color: Color.fromARGB(255, 211, 223, 235)),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                LocaleKeys.orders_userId.tr(),
                style: AppStyles.textStyle13Regular.copyWith(
                  color: Color(0xff64748B),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffF1F5F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  widget.orderAndUserEntity.userEntity.uId,
                  style: AppStyles.textStyle13Bold.copyWith(
                    color: Color(0xff334155),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          OrderUserDetails(userEntity: widget.orderAndUserEntity.userEntity),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: OrderDetails(
                  title: LocaleKeys.orders_orderNumber.tr(),
                  subTitle: widget.orderAndUserEntity.orderEntity.orderNumber,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OrderDetails(
                  title: LocaleKeys.orders_totalPrice.tr(),
                  subTitle: LocaleKeys.orders_totalValue.tr(
                    namedArgs: {
                      'amount': widget.orderAndUserEntity.orderEntity.totalPrice
                          .toInt()
                          .toString(),
                      'currency': LocaleKeys.orders_currency.tr(),
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OrderDetails(
                  title: LocaleKeys.orders_cashPayment.tr(),
                  subTitle: widget.orderAndUserEntity.orderEntity.payWithCash
                      ? LocaleKeys.orders_payment_cash.tr()
                      : LocaleKeys.orders_payment_notCash.tr(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OrderDetails(
                  title: LocaleKeys.orders_orderDate.tr(),
                  subTitle: getSpecificDate(
                    date: widget.orderAndUserEntity.orderEntity.date,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          seeMore == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddressDetails(
                      shippingAddressEntity: widget
                          .orderAndUserEntity
                          .orderEntity
                          .shippingAddressEntity,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      LocaleKeys.orders_items.tr(),
                      style: AppStyles.textStyle13Bold,
                    ),
                    const SizedBox(height: 8),
                    ListOfOrders(
                      items: widget
                          .orderAndUserEntity
                          .orderEntity
                          .cartEntity
                          .items,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xffFECDD3)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          backgroundColor: Color(0xffFFF1F2),
                          foregroundColor: Color(0xffBE123C),
                        ),
                        onPressed: () {
                          seeMore = false;
                          setState(() {});
                        },
                        label: Text(LocaleKeys.orders_seeLess.tr()),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xffA7F3D0)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      backgroundColor: Color(0xffECFDF5),
                      foregroundColor: Color(0xff065F46),
                    ),
                    onPressed: () {
                      seeMore = true;
                      setState(() {});
                    },
                    label: Text(LocaleKeys.orders_seeMore.tr()),
                  ),
                ),
        ],
      ),
    );
  }
}
