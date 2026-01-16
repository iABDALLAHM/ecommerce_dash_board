import 'package:ecommerce_dash_board/features/add_notification/presentation/views/add_notification_view.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/orders_view.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => OrdersView());
    case AddNotificationView.routeName:
      return MaterialPageRoute(builder: (context) => AddNotificationView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
