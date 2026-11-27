import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/get_notification_image.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddNotificationBody extends StatefulWidget {
  const AddNotificationBody({super.key});

  @override
  State<AddNotificationBody> createState() => _AddNotificationBodyState();
}

class _AddNotificationBodyState extends State<AddNotificationBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(LocaleKeys.addNotification_notificationTitle.tr()),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: LocaleKeys.addNotification_titleHint.tr(),
              onSaved: (value) {},
            ),
            const SizedBox(height: 16),
            Text(LocaleKeys.addNotification_message.tr()),
            const SizedBox(height: 8),
            CustomTextFormField(
              maxLines: 3,
              hintText: LocaleKeys.addNotification_messageHint.tr(
                namedArgs: {'discount': '30', 'minutes': '30'},
              ),
              onSaved: (value) {},
            ),
            const SizedBox(height: 22),
            Text(LocaleKeys.addNotification_imageOptional.tr()),
            const SizedBox(height: 8),
            GetNotificationImage(),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Color(0xff059669),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                label: Text(LocaleKeys.addNotification_sendButton.tr()),
                icon: RotatedBox(quarterTurns: 5, child: Icon(Icons.send)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
