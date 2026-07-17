import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/custom_drop_down_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusOptions extends StatefulWidget {
  const OrderStatusOptions({super.key, required this.orderAndUserEntity});
  final OrderAndUserEntity orderAndUserEntity;
  @override
  State<OrderStatusOptions> createState() => _OrderStatusOptionsState();
}

class _OrderStatusOptionsState extends State<OrderStatusOptions> {
  OrderStatus? selectedValue = OrderStatus.pending;

  @override
  Widget build(BuildContext context) {
    var orderNumber = widget.orderAndUserEntity.orderEntity.orderNumber;
    var orderStatus = widget.orderAndUserEntity.orderEntity.orderStatusEntity;

    return DropdownButton(
      value: selectedValue,
      hint: Text("اختر حالة الطلب"),
      items: [
        DropdownMenuItem(
          value: OrderStatus.pending,
          child: Text("الحالية: قيد الإنتظار"),
        ),
        DropdownMenuItem(
          value: OrderStatus.accepted,
          onTap: () {
            _handleAcceptOrderState(
              orderStatus: orderStatus,
              context: context,
              orderNumber: orderNumber,
            );
          },
          child: CustomDropDownItem(
            title: "تم قبول الطلب",
            status: orderStatus.acceptOrder,
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.shipped,
          onTap: () {
            _handleShippedOrder(
              orderStatus: orderStatus,
              context: context,
              orderNumber: orderNumber,
            );
          },
          child: CustomDropDownItem(
            title: "تم شحنه",
            status: orderStatus.orderShipped,
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.outOfDelivery,
          onTap: () {
            _handleOutOfDeliveryOrder(
              orderStatus: orderStatus,
              context: context,
              orderNumber: orderNumber,
            );
          },
          child: CustomDropDownItem(
            title: "في الطريق",
            status: orderStatus.outOfDelivery,
          ),
        ),
        DropdownMenuItem(
          value: OrderStatus.delivered,
          onTap: () {
            _handelDeliverdOrder(
              orderStatus: orderStatus,
              context: context,
              orderNumber: orderNumber,
            );
          },
          child: CustomDropDownItem(
            title: "تم التسليم",
            status: orderStatus.orderDelivered,
          ),
        ),
      ],
      onChanged: (value) {
        selectedValue = value;
      },
    );
  }

  void _handelDeliverdOrder({
    required OrderStatusEntity orderStatus,
    required BuildContext context,
    required String orderNumber,
  }) {
    if (orderStatus.acceptOrder == true &&
        orderStatus.orderShipped == true &&
        orderStatus.outOfDelivery == true &&
        orderStatus.orderDelivered != true) {
      setState(() {
        selectedValue = OrderStatus.delivered;
      });
      context.read<ChangeOrderStatusCubit>().deliverdOrder(
        orderNumber: orderNumber,
      );
    } else if (orderStatus.orderDelivered == true) {
      showSnackBar(context, message: "تمت العملية من قبل");
    } else {
      showSnackBar(context, message: "اكمل الحالات السابقة اولا");
    }
  }

  void _handleOutOfDeliveryOrder({
    required OrderStatusEntity orderStatus,
    required BuildContext context,
    required String orderNumber,
  }) {
    if (orderStatus.acceptOrder == true &&
        orderStatus.orderShipped == true &&
        orderStatus.outOfDelivery != true) {
      setState(() {
        selectedValue = OrderStatus.outOfDelivery;
      });
      context.read<ChangeOrderStatusCubit>().outOfDelivery(
        orderNumber: orderNumber,
      );
    } else if (orderStatus.outOfDelivery == true) {
      showSnackBar(context, message: "تمت العملية من قبل");
    } else {
      showSnackBar(context, message: "اكمل الحالات السابقة اولا");
    }
  }

  void _handleShippedOrder({
    required OrderStatusEntity orderStatus,
    required BuildContext context,
    required String orderNumber,
  }) {
    if (orderStatus.acceptOrder == true && orderStatus.orderShipped != true) {
      setState(() {
        selectedValue = OrderStatus.shipped;
      });

      context.read<ChangeOrderStatusCubit>().shippedOrder(
        orderNumber: orderNumber,
      );
    } else if (orderStatus.orderShipped == true) {
      showSnackBar(context, message: "تمت العملية من قبل");
    } else {
      showSnackBar(context, message: "اكمل الحالات السابقة اولا");
    }
  }

  void _handleAcceptOrderState({
    required BuildContext context,
    required OrderStatusEntity orderStatus,
    required String orderNumber,
  }) {
    if (orderStatus.acceptOrder != true) {
      setState(() {
        selectedValue = OrderStatus.accepted;
      });
      context.read<ChangeOrderStatusCubit>().acceptOrder(
        orderNumber: orderNumber,
      );
    } else if (orderStatus.acceptOrder == true) {
      showSnackBar(context, message: "تمت العملية من قبل");
    }
  }
}

enum OrderStatus { accepted, shipped, outOfDelivery, delivered, pending }
