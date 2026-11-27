import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/custom_admin_image.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_dark_mode_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_language_button.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/dashboard_body.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/dashboard_view_bloc_provider.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return DashboardViewBlocProvider(
      child: Scaffold(
        appBar: buildDashboardViewAppBar(context: context),
        body: DashBoardBody(),
      ),
    );
  }

  AppBar buildDashboardViewAppBar({required BuildContext context}) => AppBar(
    actions: [
      CustomLanguageButton(),
      const SizedBox(width: 10),
      CustomDarkModeButton(),
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAdminImage(),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetUserDataCubit, GetUserDataState>(
              builder: (context, state) {
                if (state is SuccessGetUserDataState) {
                  return Row(
                    children: [
                      Text(
                        LocaleKeys.dashboard_welcomeBack.tr(
                          context: context,
                          namedArgs: {'name': state.userEntity.name},
                        ),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff94A3B8),
                        ),
                      ),
                    ],
                  );
                }
                return Skeletonizer(
                  child: Text(
                    LocaleKeys.dashboard_welcomeLoading.tr(),
                    style: TextStyle(fontSize: 15, color: Color(0xff94A3B8)),
                  ),
                );
              },
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.dashboard_title.tr(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: Color(0xffD1FAE5),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xffA7F3D0)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.dashboard_role.tr(context: context),
                    style: TextStyle(
                      color: Color(0xff047857),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
