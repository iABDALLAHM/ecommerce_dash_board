import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_password_field.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  String email = "";
  String password = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: .5, color: Colors.grey)],
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        border: Border.all(color: Color(0xffE2E8F0), width: 2),
      ),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.common_email.tr(context: context),
              style: AppStyles.textStyle13Bold,
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "admin@store.com",
              onSaved: (value) {
                email = value ?? "";
              },
              prefixIcon: Icon(Icons.email, color: Color(0xff64748B)),
            ),
            const SizedBox(height: 15),
            Text(
              LocaleKeys.common_password.tr(),
              style: AppStyles.textStyle13Bold,
            ),
            const SizedBox(height: 8),
            CustomPasswordField(
              onSaved: (value) {
                password = value ?? "";
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.login_forgotPassword.tr(),
                    style: TextStyle(color: Color(0xff059669)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff059669),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().login(
                      email: email,
                      password: password,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: Text(
                  LocaleKeys.login_loginButton.tr(),
                  style: AppStyles.textStyle13Bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
