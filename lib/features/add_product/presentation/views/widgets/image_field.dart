import 'dart:io';
import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onChange});
  final ValueChanged<File> onChange;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? imageFile;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Skeletonizer(
      containersColor: AppColors.primaryColor,
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          await _pickImageFromgallery();
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: imageFile != null
                  ? SizedBox(
                      height: height * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(imageFile!),
                      ),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: imageFile == null
                  ? null
                  : IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          imageFile = null;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromgallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    widget.onChange(imageFile!);
  }
}
