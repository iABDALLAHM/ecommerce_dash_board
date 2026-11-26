import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowSignOutDialog extends StatelessWidget {
  const ShowSignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Color(0xffE2E8F0)),
      ),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.close, size: 30),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xffECFDF5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xff6EE7B7)),
              ),
              child: Icon(Icons.logout_rounded, color: Color(0xff059669)),
            ),
            const SizedBox(height: 16),
            Text("هل ترغب في تسجيل الخروج؟", style: AppStyles.textStyle19Bold),
            const SizedBox(height: 7),
            Text(
              textAlign: TextAlign.center,
              "ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى لوحة الإدارة",
              style: AppStyles.textStyle13Regular.copyWith(
                color: Color(0xff64748B),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Color(0xff059669),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context.read<SignOutCubit>().signOut();
                      },
                      child: Text("تأكيد", style: AppStyles.textStyle13Bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xff059669), width: 2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Color(0xff059669),
                      ),
                      child: Text("لا أرغب", style: AppStyles.textStyle13Bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
