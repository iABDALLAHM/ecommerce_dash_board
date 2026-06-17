import 'package:ecommerce_dash_board/features/add_notification/add_notification.dart';
import 'package:ecommerce_dash_board/features/add_product/add_product.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/orders_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static String addProduct = "/addProduct";
  static String dashboard = "/dashboard";
  static String orders = "/orders";
  static String addNotification = "/addNotification";
  static final GoRouter router = GoRouter(
    initialLocation: dashboard,
    routes: [
      GoRoute(path: addProduct, builder: (context, state) => AddProductView()),
      GoRoute(path: dashboard, builder: (context, state) => DashboardView()),
      GoRoute(
        path: addNotification,
        builder: (context, state) => AddNotificationView(),
      ),
      GoRoute(path: orders, builder: (context, state) => OrdersView()),
    ],
  );
}
