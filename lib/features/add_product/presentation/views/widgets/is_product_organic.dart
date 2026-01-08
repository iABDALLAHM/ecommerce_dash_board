import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class IsProductOrganic extends StatelessWidget {
  const IsProductOrganic({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("منتج عضوي؟", style: AppStyles.textStyle16Bold),
        CustomCheckBox(onChange: (value) {
          onChange(value);
        }),
      ],
    );
  }
}
