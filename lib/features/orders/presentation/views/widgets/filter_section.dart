import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text("البحث", style: AppStyles.textStyle19Bold),
          const SizedBox(width: 20),

          Icon(Icons.shuffle),
        ],
      ),
    );
  }
}