import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_featured.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_organic.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool? isFeatured;
  bool? isOrganic;
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(hintText: "اسم المنتج", onSaved: (value) {}),
              const SizedBox(height: 8),
              CustomTextFormField(hintText: "سعر المنتج", onSaved: (value) {}),
              const SizedBox(height: 8),
              CustomTextFormField(hintText: "كود المنتج", onSaved: (value) {}),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: "صلاحية المنتج",
                onSaved: (value) {},
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: "عدد الكالوريز",
                onSaved: (value) {},
              ),
              const SizedBox(height: 8),
              CustomTextFormField(hintText: "الكمية", onSaved: (value) {}),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: "وصف المنتج",
                onSaved: (value) {},
                maxLines: 5,
              ),
              const SizedBox(height: 8),
              IsProductFeatured(onChange: (value) {}),
              const SizedBox(height: 8),
              IsProductOrganic(onChange: (value) {}),
              const SizedBox(height: 16),
              ImageField(onChange: (value) {}),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomButton(
                  text: "اضافة",
                  onPressed: () {
                    validateTextFormFields();
                    checkOtherFields();
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void validateTextFormFields() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  void checkOtherFields() {
    if (isFeatured == null || isOrganic == null || imageFile == null) {
      showSnackBar(context, message: "من فضلك اكمل تعبئة الحقول");
    }
  }
}
