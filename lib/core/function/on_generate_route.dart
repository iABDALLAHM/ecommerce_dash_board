import 'package:ecommerce_dash_board/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
