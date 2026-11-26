import 'package:ecommerce_dash_board/core/widgets/custom_dark_mode_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_language_button.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_card.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/views/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CustomLanguageButton(), CustomDarkModeButton()],
            ),
            const SizedBox(height: 20),
            LoginHeader(),
            const SizedBox(height: 24),
            LoginCard(),
          ],
        ),
      ),
    );
  }
}
