import 'package:flutter/material.dart';

class CustomDropDownItem extends StatelessWidget {
  const CustomDropDownItem({
    super.key,
    required this.title,
    required this.status,
  });
  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Icon(Icons.circle, color: status == true ? Colors.green : Colors.red),
      ],
    );
  }
}
