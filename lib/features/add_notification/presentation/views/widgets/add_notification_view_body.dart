import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({super.key});

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState extends State<AddNotificationViewBody> {
  late String notificationTitle, notificationBody;
  late int discountPercentage;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "عنوان الإشعار",
                  onSaved: (value) {},
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextFormField(
                  hintText: "الرسالة",
                  onSaved: (value) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: "نسبة الخصم",
            onSaved: (value) {},
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ImageField(onChange: (value) {}),
          const SizedBox(height: 20),
          SizedBox(
            height: 54,
            width: double.infinity,
            child: CustomButton(text: "إضافة", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
