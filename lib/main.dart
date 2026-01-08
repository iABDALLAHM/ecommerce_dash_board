import 'package:ecommerce_dash_board/core/function/on_generate_route.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceDashboard());
}

class EcommerceDashboard extends StatelessWidget {
  const EcommerceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
