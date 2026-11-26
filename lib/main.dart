import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/firebase_options.dart';
import 'package:ecommerce_dash_board/generated/codegen_loader.g.dart';
import 'package:ecommerce_dash_board/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseApiKey);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initGetIt();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("ar"), Locale("en")],
      path: 'assets/translations',
      fallbackLocale: Locale("ar"),
      assetLoader: CodegenLoader(),
      child: EcommerceDashboard(),
    ),
  );
}

class EcommerceDashboard extends StatelessWidget {
  const EcommerceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: "Cairo",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
