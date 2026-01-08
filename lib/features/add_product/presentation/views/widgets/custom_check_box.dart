import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange(isChecked);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isChecked == false ? Colors.grey : Colors.transparent,
          ),
        ),
        child: isChecked == false
            ? Icon(null)
            : Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
