import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/get_notification_image.dart';
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
            Text("عنوان الإشعار"),
            const SizedBox(height: 8),
            CustomTextFormField(
              hintText: "تخفيضات نهاية الأسبوع وصلت! 🔥",
              onSaved: (value) {},
            ),
            const SizedBox(height: 16),
            Text("نص الرسالة"),
            const SizedBox(height: 8),
            CustomTextFormField(
              maxLines: 3,
              hintText:
                  "استمتع بخصم حتى 30% على تشكيلة الفواكه الطازجة المختارة بعناية. اطلب الآن واستلم في نصف ساعة!",
              onSaved: (value) {},
            ),
            const SizedBox(height: 22),
            Text("صورة مرفقة مع الإشعار (اختياري)"),
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
                label: Text("إرسال الإشعار الآن"),
                icon: RotatedBox(quarterTurns: 5, child: Icon(Icons.send)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
