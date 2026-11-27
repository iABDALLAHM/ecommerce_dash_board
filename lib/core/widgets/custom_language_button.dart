import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomLanguageButton extends StatelessWidget {
  const CustomLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return GestureDetector(
      onTap: () async {
        await context.setLocale(Locale(isArabic ? 'en' : 'ar'));
      },
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: ShapeDecoration(
          color: Color(0xffF1F5F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color(0xffE2E8F0)),
          ),
        ),
        child: isArabic
            ? Center(child: Text("EN", style: AppStyles.textStyle13Bold))
            : Center(child: Text("عربي", style: AppStyles.textStyle13Bold)),
      ),
    );
  }
}
