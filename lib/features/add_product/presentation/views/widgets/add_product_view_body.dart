import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_featured.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_organic.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatelessWidget {
  const AddProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              IsProductFeatured(),
              const SizedBox(height: 8),
              IsProductOrganic(),
              const SizedBox(height: 16),
              ImageField(onChange: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}
