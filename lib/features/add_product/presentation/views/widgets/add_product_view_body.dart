import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_featured.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_organic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool? isFeatured, isOrganic;
  File? imageFile;
  String? productName, productCode, productDescrition;
  num? productPrice;
  int? numberOfCalories, quantity, expirationMonths;
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
              CustomTextFormField(
                hintText: "اسم المنتج",
                onSaved: (value) {
                  productName = value!;
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                inputType: TextInputType.number,
                hintText: "سعر المنتج",
                onSaved: (value) {
                  productPrice = num.parse(value!);
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: "كود المنتج",
                onSaved: (value) {
                  productCode = value!.toLowerCase();
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                inputType: TextInputType.number,
                hintText: "صلاحية المنتج",
                onSaved: (value) {
                  expirationMonths = int.parse(value!);
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                inputType: TextInputType.number,
                hintText: "عدد الكالوريز",
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                inputType: TextInputType.number,
                hintText: "الكمية",
                onSaved: (value) {
                  quantity = int.parse(value!);
                },
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hintText: "وصف المنتج",
                onSaved: (value) {
                  productDescrition = value!;
                },
                maxLines: 5,
              ),
              const SizedBox(height: 8),
              IsProductFeatured(
                onChange: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(height: 8),
              IsProductOrganic(
                onChange: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(height: 16),
              ImageField(
                onChange: (value) {
                  imageFile = value;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomButton(
                  text: "اضافة",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      checkOtherFields();
                      formKey.currentState!.save();
                      ProductEntity productEntity = ProductEntity(
                        isOrganic: isOrganic!,
                        name: productName!,
                        price: productPrice!,
                        image: imageFile!,
                        code: productCode!,
                        discription: productDescrition!,
                        isFeatured: isFeatured!,
                        expirationMonths: expirationMonths!,
                        numberOfCalories: numberOfCalories!,
                        unitAmount: quantity!,
                      );
                      triggerAddProductCubit(productEntity: productEntity);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
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

  void triggerAddProductCubit({required ProductEntity productEntity}) {
    context.read<AddProductCubit>().addProduct(productEntity: productEntity);
  }

  bool checkOtherFields() {
    if (isFeatured == null || isOrganic == null || imageFile == null) {
      showSnackBar(context, message: "من فضلك اكمل تعبئة الحقول");
      return false;
    }
    return true;
  }
}
