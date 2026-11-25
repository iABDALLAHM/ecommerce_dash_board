
import 'dart:io';

import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_state.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetNotificationImage extends StatelessWidget {
  const GetNotificationImage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffCBD5E1), width: 2),
      ),
      child: BlocBuilder<GetImageCubit, GetImageState>(
        builder: (context, state) {
          if (state is GetImageSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xffaf2423),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<GetImageCubit>().removeImage();
                  },
                  icon: Icon(Icons.delete),
                ),
                Center(
                  child: Image.file(
                    height: height * 0.4,
                    File(state.imagePath),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              InkWell(
                onTap: () {
                  context.read<GetImageCubit>().pickImage();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.image_outlined, color: Color(0xff94A3B8)),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "اضغط لرفع صورة ترويجية",
                style: AppStyles.textStyle13Bold.copyWith(
                  color: Color(0xff64748B),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
