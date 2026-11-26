import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomLanguageButton extends StatefulWidget {
  const CustomLanguageButton({super.key});

  @override
  State<CustomLanguageButton> createState() => _CustomLanguageButtonState();
}

class _CustomLanguageButtonState extends State<CustomLanguageButton> {
  String? currentLang;
  @override
  Widget build(BuildContext context) {
    currentLang = context.locale.languageCode;
    return GestureDetector(
      onTap: () {
        if (context.locale.languageCode == "ar") {
          currentLang = "en";
          context.setLocale(Locale(currentLang!));
        } else {
          currentLang = "ar";
          context.setLocale(Locale(currentLang!));
        }
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
        child: currentLang == "ar"
            ? Text("EN", style: AppStyles.textStyle13Bold)
            : Text("عربي", style: AppStyles.textStyle13Bold),
      ),
    );
  }
}
