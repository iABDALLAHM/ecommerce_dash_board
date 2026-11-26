import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:ecommerce_dash_board/core/cubits/get_user_data_cubit/get_user_data_state.dart';
import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAdminImage extends StatelessWidget {
  const CustomAdminImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Color(0xffE2E8F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.primaryColor, width: 3),
        ),
      ),
      child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is SuccessGetUserDataState) {
            return ClipOval(
              child: Image.network(
                state.userEntity.userImage,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, color: Color(0xff059669)),
              ),
            );
          }
          return Center(child: Icon(Icons.person));
        },
      ),
    );
  }
}
