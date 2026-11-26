import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/custom_admin_image.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_dark_mode_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_language_button.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/dashboard_body.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/dashboard_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardViewBlocProvider(
      child: Scaffold(
        appBar: buildDashboardViewAppBar(),
        body: DashBoardBody(),
      ),
    );
  }

  AppBar buildDashboardViewAppBar() => AppBar(
    actions: [
      CustomLanguageButton(),
      const SizedBox(width: 10),
      CustomDarkModeButton(),
    ],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: CustomAdminImage()),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "مرحباً بك مجدداً",
              style: TextStyle(fontSize: 15, color: Color(0xff94A3B8)),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "لوحة الإدارة",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    "مسؤول",
                    style: TextStyle(
                      color: Color(0xff047857),
                      fontSize: 15,
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
