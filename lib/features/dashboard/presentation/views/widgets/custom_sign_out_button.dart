import 'package:ecommerce_dash_board/features/dashboard/presentation/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:ecommerce_dash_board/features/dashboard/presentation/views/widgets/show_sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignOutButton extends StatelessWidget {
  const CustomSignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(width: 2, color: Color(0xffFECDD3)),
        ),
        backgroundColor: Color(0xffFFF1F2),
        foregroundColor: Color(0xffE11D48),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            var signOutCubit = context.read<SignOutCubit>();
            return BlocProvider.value(
              value: signOutCubit,
              child: ShowSignOutDialog(),
            );
          },
        );
      },
      label: Text("تسجيل الخروج من لوحة التحكم"),
      icon: Icon(Icons.logout_outlined),
    );
  }
}
