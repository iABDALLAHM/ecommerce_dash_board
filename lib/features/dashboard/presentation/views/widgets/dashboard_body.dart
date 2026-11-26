import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/get_orders_cubit/get_orders_states.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_states.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/custom_action_card.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/custom_sign_out_button.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/dashboard_bloc_listener.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/state_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({super.key});

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    return DashboardBlocListener(
      child: BlocBuilder<SignOutCubit, SignOutStates>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is SignOutLoadingState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    BlocBuilder<GetOrdersCubit, GetOrdersStates>(
                      builder: (context, state) {
                        if (state is GetOrdersSuccessState) {
                          return Row(
                            children: [
                              Expanded(
                                child: StateCard(
                                  onTap: () {
                                    if (state.todayOrders.isNotEmpty) {
                                      context.push(AppRoutes.orders);
                                    }
                                  },
                                  borderColor: Color(0xffD1FAE5),
                                  cardColor: Color(0xffECFDF5),
                                  title: 'الطلبات اليوم',
                                  stateIcon: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color(0xff059669),
                                  ),
                                  iconBackgroundColor: Color(0xffD1FAE5),
                                  subTitle: state.todayOrders.length.toString(),
                                ),
                              ),
                              Expanded(
                                child: StateCard(
                                  borderColor: Color(0xffFEF3C7),
                                  cardColor: Color(0xffFFFBEB),
                                  title: 'إجمالي المنتجات',
                                  stateIcon: Icon(
                                    Icons.view_in_ar_outlined,
                                    color: Color(0xffD97706),
                                  ),
                                  iconBackgroundColor: Color(0xffFEF3C7),
                                  subTitle: state.allOrders.length.toString(),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          );
                        }
                        return Skeletonizer(
                          child: Row(
                            children: [
                              Expanded(
                                child: StateCard(
                                  borderColor: Color(0xffD1FAE5),
                                  cardColor: Color(0xffECFDF5),
                                  title: 'الطلبات اليوم',
                                  stateIcon: Icon(
                                    Icons.shopping_bag_outlined,
                                    color: Color(0xff059669),
                                  ),
                                  iconBackgroundColor: Color(0xffD1FAE5),
                                  subTitle: "",
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: StateCard(
                                  borderColor: Color(0xffFEF3C7),
                                  cardColor: Color(0xffFFFBEB),
                                  title: 'إجمالي المنتجات',
                                  stateIcon: Icon(
                                    Icons.view_in_ar_outlined,
                                    color: Color(0xffD97706),
                                  ),
                                  iconBackgroundColor: Color(0xffFEF3C7),
                                  subTitle: "",
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "الإجراءات والعمليات",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),

                    CustomActionCard(
                      color: Color(0xffD1FAE5),
                      iconColor: Color(0xff047857),
                      title: "إضافة منتج جديد",
                      subTitle: "إضافة فاكهة أو خضار جديدة مع السعر والتفاصيل",
                      onTap: () {
                        context.push(AppRoutes.addProduct);
                      },
                      icon: Icons.add_rounded,
                    ),

                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffDBEAFE),
                      iconColor: Color(0xff1D4ED8),
                      title: "إدارة الطلبات (Orders)",
                      subTitle: "متابعة وتحديث حالات طلبات الزبائن والشحن",
                      onTap: () {
                        context.push(AppRoutes.orders);
                      },
                      icon: Icons.assignment_outlined,
                    ),
                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffFEF3C7),
                      iconColor: Color(0xffB45309),
                      title: "إضافة المنتجات المميزة",
                      subTitle:
                          "رفع وتحديث بانرات العروض المميزة في الصفحة الرئيسية",
                      onTap: () {
                        context.push(AppRoutes.addFeaturedProduct);
                      },
                      icon: Icons.star_rate_outlined,
                    ),
                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffF3E8FF),
                      iconColor: Color(0xff7E22CE),
                      title: "إرسال إشعار ترويجي",
                      subTitle:
                          "إرسال رسائل وحملات تسويقية وتنبيهات لجميع المستخدمين",
                      onTap: () {
                        context.push(AppRoutes.addNotification);
                      },
                      icon: Icons.campaign_outlined,
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: CustomSignOutButton(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
