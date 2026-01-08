import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    this.maxLines = 1,
    this.inputType = TextInputType.text,
  });
  final String hintText;
  final Function(String?) onSaved;
  final int maxLines;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      maxLines: maxLines,
      onSaved: onSaved,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(fontSize: 0),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        hintText: hintText,
        hintStyle: AppStyles.textStyle13Bold.copyWith(color: Color(0xff949D9E)),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    Color color = const Color(0xffE6E9EA),
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: color, width: 1),
  );
}
