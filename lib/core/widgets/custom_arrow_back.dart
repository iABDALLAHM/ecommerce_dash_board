import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xffF1F5F9),
          shape: OvalBorder(
            side: BorderSide(color: Color(0xffE2E8F0), width: 2),
          ),
        ),
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
