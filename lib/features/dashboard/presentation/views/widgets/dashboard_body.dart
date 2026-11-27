import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
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
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

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
                                  title: LocaleKeys.dashboard_todayOrders.tr(context: context),
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
                                  title: LocaleKeys.dashboard_totalProducts
                                      .tr(),
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
                                  title: LocaleKeys.dashboard_todayOrders.tr(),
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
                                  title: LocaleKeys.dashboard_totalProducts
                                      .tr(),
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
                      LocaleKeys.dashboard_actionsTitle.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),

                    CustomActionCard(
                      color: Color(0xffD1FAE5),
                      iconColor: Color(0xff047857),
                      title: LocaleKeys.dashboard_actions_addProduct.tr(),
                      subTitle: LocaleKeys
                          .dashboard_actions_addProductDescription
                          .tr(),
                      onTap: () {
                        context.push(AppRoutes.addProduct);
                      },
                      icon: Icons.add_rounded,
                    ),

                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffDBEAFE),
                      iconColor: Color(0xff1D4ED8),
                      title: LocaleKeys.dashboard_actions_manageOrders.tr(),
                      subTitle: LocaleKeys
                          .dashboard_actions_manageOrdersDescription
                          .tr(context: context),
                      onTap: () {
                        context.push(AppRoutes.orders);
                      },
                      icon: Icons.assignment_outlined,
                    ),
                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffFEF3C7),
                      iconColor: Color(0xffB45309),
                      title: LocaleKeys.dashboard_actions_featuredProducts.tr(),
                      subTitle: LocaleKeys
                          .dashboard_actions_featuredProductsDescription
                          .tr(),
                      onTap: () {
                        context.push(AppRoutes.addFeaturedProduct);
                      },
                      icon: Icons.star_rate_outlined,
                    ),
                    const SizedBox(height: 10),

                    CustomActionCard(
                      color: Color(0xffF3E8FF),
                      iconColor: Color(0xff7E22CE),
                      title: LocaleKeys.dashboard_actions_sendNotification.tr(),
                      subTitle: LocaleKeys
                          .dashboard_actions_sendNotificationDescription
                          .tr(),
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
