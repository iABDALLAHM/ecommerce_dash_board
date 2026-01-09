import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/function/on_generate_route.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_dash_board/firebase_options.dart';
import 'package:ecommerce_dash_board/generated/l10n.dart';
import 'package:ecommerce_dash_board/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseApiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initGetIt();
  runApp(const EcommerceDashboard());
}

class EcommerceDashboard extends StatelessWidget {
  const EcommerceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cairo",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
      debugShowCheckedModeBanner: false,
      locale: const Locale("ar"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
