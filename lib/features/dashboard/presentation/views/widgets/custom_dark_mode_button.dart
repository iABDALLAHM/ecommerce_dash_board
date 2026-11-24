import 'package:flutter/material.dart';

class CustomDarkModeButton extends StatelessWidget {
  const CustomDarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Color(0xffF1F5F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Color(0xffE2E8F0)),
          ),
        ),
        child: Icon(Icons.dark_mode_rounded),
      ),
    );
  }
}
