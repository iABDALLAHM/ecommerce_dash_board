import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_password_field.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("البريد الإلكتروني", style: AppStyles.textStyle13Bold),
          const SizedBox(height: 8),
          CustomTextFormField(
            hintText: "admin@store.com",
            onSaved: (value) {},
            prefixIcon: Icon(Icons.email, color: Color(0xff64748B)),
          ),
          const SizedBox(height: 15),
          Text("كلمة المرور", style: AppStyles.textStyle13Bold),
          const SizedBox(height: 8),
          CustomPasswordField(onSaved: (value) {}),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "نسيت كلمة المرور؟",
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
              onPressed: () {},
              child: Text("تسجيل الدخول", style: AppStyles.textStyle13Bold),
            ),
          ),
        ],
      ),
    );
  }
}
