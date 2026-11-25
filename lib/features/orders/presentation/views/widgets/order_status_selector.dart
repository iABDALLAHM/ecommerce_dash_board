
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/orders/data/models/status_style_model/status_style_model.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_status_entity/order_status_entity.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusSelector extends StatelessWidget {
  const OrderStatusSelector({
    super.key,
    required this.currentStatus,
    required this.onStatusChanged,
    required this.orderEntity,
  });

  final String currentStatus;
  final ValueChanged<String> onStatusChanged;
  final OrderEntity orderEntity;

  static const List<String> statuses = [
    "تم قبول الطلب",
    "تم شحنه",
    "في الطريق",
    "تم التسليم",
  ];

  @override
  Widget build(BuildContext context) {
    final style = getStatusStyle(status: currentStatus);
    return PopupMenuButton<String>(
      onSelected: onStatusChanged,
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      elevation: 4,
      itemBuilder: (context) {
        return statuses.map((status) {
          final itemStyle = getStatusStyle(status: status);
          final isDone = isStatusCompleted(status: status);
          final isSelected = (status == currentStatus);
          return PopupMenuItem<String>(
            onTap: () {
              if (status == "تم قبول الطلب") {
                _handleAcceptOrderState(
                  context: context,
                  orderEntity: orderEntity,
                  orderStatus: orderEntity.orderStatusEntity,
                );
              } else if (status == "تم شحنه") {
                _handleShippedOrder(
                  context: context,
                  orderEntity: orderEntity,
                  orderStatus: orderEntity.orderStatusEntity,
                );
              } else if (status == "في الطريق") {
                _handleOutOfDeliveryOrder(
                  context: context,
                  orderEntity: orderEntity,
                  orderStatus: orderEntity.orderStatusEntity,
                );
              } else if (status == "تم التسليم") {
                _handelDeliverdOrder(
                  context: context,
                  orderEntity: orderEntity,
                  orderStatus: orderEntity.orderStatusEntity,
                );
              }
            },
            value: status,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: itemStyle.dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                const Spacer(),
                if (isDone)
                  Icon(
                    Icons.check_rounded,
                    size: 16,
                    color: itemStyle.dotColor,
                  ),
              ],
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: style.backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: style.borderColor, width: 1.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: style.dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "الحالية: $currentStatus",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: style.textColor,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: style.textColor,
            ),
          ],
        ),
      ),
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

  StatusStyleModel getStatusStyle({required String status}) {
    switch (status) {
      case "تم قبول الطلب":
        return const StatusStyleModel(
          backgroundColor: Color(0xFFEFF6FF),
          borderColor: Color(0xFF93C5FD),
          dotColor: Color(0xFF3B82F6),
          textColor: Color(0xFF1E40AF),
        );
      case "تم شحنه":
        return const StatusStyleModel(
          backgroundColor: Color(0xFFF5F3FF),
          borderColor: Color(0xFFC4B5FD),
          dotColor: Color(0xFF8B5CF6),
          textColor: Color(0xFF5B21B6),
        );
      case "في الطريق":
        return const StatusStyleModel(
          backgroundColor: Color(0xFFFFFBEB),
          borderColor: Color(0xFFFCD34D),
          dotColor: Color(0xFFF59E0B),
          textColor: Color(0xFF92400E),
        );
      case "تم التسليم":
        return const StatusStyleModel(
          backgroundColor: Color(0xFFECFDF5),
          borderColor: Color(0xFF6EE7B7),
          dotColor: Color(0xFF10B981),
          textColor: Color(0xFF065F46),
        );
      default:
        return const StatusStyleModel(
          backgroundColor: Color(0xFFFEF9C3),
          borderColor: Color(0xFFFACC15),
          dotColor: Color(0xFFF59E0B),
          textColor: Color(0xFF92400E),
        );
    }
  }

  bool isStatusCompleted({required String status}) {
    switch (status) {
      case "تم قبول الطلب":
        return orderEntity.orderStatusEntity.acceptOrder;
      case "تم شحنه":
        return orderEntity.orderStatusEntity.orderShipped;
      case "في الطريق":
        return orderEntity.orderStatusEntity.outOfDelivery;
      case "تم التسليم":
        return orderEntity.orderStatusEntity.orderDelivered;
      default:
        return false;
    }
  }
}
