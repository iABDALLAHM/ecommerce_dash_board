import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderStatusOptions extends StatefulWidget {
  const OrderStatusOptions({super.key, required this.orderNumber});
  final String orderNumber;
  @override
  State<OrderStatusOptions> createState() => _OrderStatusOptionsState();
}

class _OrderStatusOptionsState extends State<OrderStatusOptions> {
  OrderStatus? selectedValue = OrderStatus.pending;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      hint: Text("اختر حالة الطلب"),
      items: [
        DropdownMenuItem(
          value: OrderStatus.pending,

          child: Text("قيد الإنتظار"),
        ),
        DropdownMenuItem(
          value: OrderStatus.accepted,
          onTap: () {
            context.read<ChangeOrderStatusCubit>().acceptOrder(
              orderNumber: widget.orderNumber,
            );
          },
          child: Text("تم قبول الطلب"),
        ),
        DropdownMenuItem(
          value: OrderStatus.shipped,
          onTap: () {
            context.read<ChangeOrderStatusCubit>().shippedOrder(
              orderNumber: widget.orderNumber,
            );
          },
          child: Text("تم شحنه"),
        ),
        DropdownMenuItem(
          value: OrderStatus.outOfDelivery,
          onTap: () {
            context.read<ChangeOrderStatusCubit>().outOfDelivery(
              orderNumber: widget.orderNumber,
            );
          },
          child: Text("في الطريق"),
        ),
        DropdownMenuItem(
          value: OrderStatus.delivered,
          onTap: () {
            context.read<ChangeOrderStatusCubit>().deliverdOrder(
              orderNumber: widget.orderNumber,
            );
          },
          child: Text("تم التسليم"),
        ),
      ],
      onChanged: (value) {
        selectedValue = value;
        setState(() {});
      },
    );
  }
}

enum OrderStatus { accepted, shipped, outOfDelivery, delivered, pending }
