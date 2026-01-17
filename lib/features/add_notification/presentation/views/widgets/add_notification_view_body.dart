import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/manager/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: "عنوان الإشعار",
                    onSaved: (value) {
                      notificationTitle = value!;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CustomTextFormField(
                    hintText: "الرسالة",
                    onSaved: (value) {
                      notificationBody = value!;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "نسبة الخصم",
              onSaved: (value) {
                discountPercentage = int.parse(value!);
              },
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ImageField(
              onChange: (value) {
                imageFile = value;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 54,
              width: double.infinity,
              child: CustomButton(
                text: "إضافة",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NotificationEntity notification = NotificationEntity(
                      date: DateTime.now(),
                      image: imageFile,
                      notificationTitle: notificationTitle,
                      notificationBody: notificationBody,
                      discountPercentage: discountPercentage,
                    );
                    context.read<AddNotificationCubit>().addNotification(
                      notification: notification,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
