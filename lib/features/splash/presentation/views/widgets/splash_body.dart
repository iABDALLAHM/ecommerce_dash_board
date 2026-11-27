import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:ecommerce_dash_board/features/splash/presentation/views/widgets/splash_body_bloc_listener.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    context.read<SplashCubit>().checkUserStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashBodyBlocListener(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6EE7B7),
                    blurRadius: 100,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 40,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xff6EE7B7)),
                color: Colors.white,
              ),
              child: Icon(
                Icons.security_outlined,
                color: Color(0xff059669),
                size: 30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              LocaleKeys.splash_title.tr(),
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xffECFDF5),
                border: Border.all(width: 2, color: Color(0xff6EE7B7)),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                LocaleKeys.splash_adminPortal.tr(),
                style: AppStyles.textStyle13Bold.copyWith(
                  color: Color(0xff059669),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
