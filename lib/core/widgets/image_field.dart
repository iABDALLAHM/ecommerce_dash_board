import 'dart:io';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = context.watch<GetImageCubit>().state.image;
    bool isLoading = context.watch<GetImageCubit>().state.isLoading;
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Skeletonizer(
      containersColor: AppColors.primaryColor,
      enabled: isLoading,
      child: GestureDetector(
        onTap: () {
          context.read<GetImageCubit>().pickImage();
        },
        child: Stack(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: imagePath.isNotEmpty
                  ? SizedBox(
                      height: height * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(File(imagePath)),
                      ),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: imagePath.isEmpty
                  ? null
                  : IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        context.read<GetImageCubit>().removeImage();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
