import 'dart:math';

import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/cubits/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/cubits/add_notification_cubit/add_notification_state.dart';
import 'package:ecommerce_dash_board/core/widgets/image_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNotificationViewBody extends StatefulWidget {
  const AddNotificationViewBody({super.key});

  @override
  State<AddNotificationViewBody> createState() =>
      _AddNotificationViewBodyState();
}

class _AddNotificationViewBodyState extends State<AddNotificationViewBody> {
  String notificationBody = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationCubit, AddNotificationStates>(
      listener: (context, state) {
        if (state is SuccessAddNotificationState) {
          context.pop();
          showSnackBar(context, message: "تم إضافة إشعار  بنجاح");
        } else if (state is FailureAddNotificationState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingAddNotificationState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: "الرسالة",
                      onSaved: (value) {
                        notificationBody = value ?? "";
                      },
                    ),
                    const SizedBox(height: 20),
                    ImageField(),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 54,
                      width: double.infinity,
                      child: CustomButton(
                        text: "إضافة",
                        onPressed: () {
                          String imagePath = context
                              .read<GetImageCubit>()
                              .state
                              .image;

                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            final NotificationEntity notification =
                                NotificationEntity(
                                  notificationDate: DateTime.now(),
                                  notificationImage: imagePath,
                                  notificationBody: notificationBody,
                                  id: generateNotificationNumber(),
                                );
                            triggerAddNotificationCubit(
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
            ),
          ),
        );
      },
    );
  }

  void triggerAddNotificationCubit({required NotificationEntity notification}) {
    context.read<AddNotificationCubit>().addNotification(
      notification: notification,
    );
  }

  String generateNotificationNumber() {
    var random = Random();
    String number = '';

    for (int i = 0; i < 7; i++) {
      number += random.nextInt(10).toString();
    }

    return number;
  }
}
