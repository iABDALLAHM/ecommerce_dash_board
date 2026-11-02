import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_and_user_entity/order_and_user_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/enums/order_status_enum.dart';
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
  OrderStatus? selectedValue;

  @override
  Widget build(BuildContext context) {
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
              orderEntity: widget.orderAndUserEntity.orderEntity,
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
              orderEntity: widget.orderAndUserEntity.orderEntity,
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
              orderEntity: widget.orderAndUserEntity.orderEntity,
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
              orderEntity: widget.orderAndUserEntity.orderEntity,
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
    required OrderEntity orderEntity,
  }) {
    if (orderStatus.acceptOrder == true &&
        orderStatus.orderShipped == true &&
        orderStatus.outOfDelivery == true &&
        orderStatus.orderDelivered != true) {
      context.read<ChangeOrderStatusCubit>().deliverdOrder(
        orderEntity: orderEntity,
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
    required OrderEntity orderEntity,
  }) {
    if (orderStatus.acceptOrder == true &&
        orderStatus.orderShipped == true &&
        orderStatus.outOfDelivery != true) {
      context.read<ChangeOrderStatusCubit>().outOfDelivery(
        orderEntity: orderEntity,
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
    required OrderEntity orderEntity,
  }) {
    if (orderStatus.acceptOrder == true && orderStatus.orderShipped != true) {
      context.read<ChangeOrderStatusCubit>().shippedOrder(
        orderEntity: orderEntity,
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
    required OrderEntity orderEntity,
  }) {
    if (orderStatus.acceptOrder != true) {
      context.read<ChangeOrderStatusCubit>().acceptOrder(
        orderEntity: orderEntity,
      );
    } else if (orderStatus.acceptOrder == true) {
      showSnackBar(context, message: "تمت العملية من قبل");
    }
  }
}
