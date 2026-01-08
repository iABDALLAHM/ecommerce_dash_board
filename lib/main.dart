import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/function/on_generate_route.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:ecommerce_dash_board/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseApiKey);
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
