import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xffECFDF5),
            border: Border.all(width: 2, color: Color(0xff6EE7B7)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.security_outlined, color: Color(0xff059669)),
        ),
        const SizedBox(height: 14),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xffECFDF5),
            border: Border.all(width: 2, color: Color(0xff6EE7B7)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            "بوابة المسؤولين",
            style: AppStyles.textStyle13Bold.copyWith(color: Color(0xff059669)),
          ),
        ),
        const SizedBox(height: 11),
        Text(
          "تسجيل الدخول للوحة الإدارة",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 11),
        Text(
          "مخصص للمسؤولين فقط. أدخل بيانات حسابك للمتابعة",
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
