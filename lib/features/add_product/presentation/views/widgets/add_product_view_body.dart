import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_states.dart';
import 'package:ecommerce_dash_board/core/widgets/image_field.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/is_product_organic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFeatured = false;
  bool isOrganic = false;
  String productName = "";
  String productCode = "";
  String productDescrition = "";
  num productPrice = 0;
  int numberOfCalories = 0;
  int quantity = 0;
  int expirationMonths = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductStates>(
      listener: (context, state) {
        if (state is SuccessAddProductState) {
          showSnackBar(context, message: "تم اضافة المنتج بنجاح");
          context.pop();
        } else if (state is FailureAddProductState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) => CustomProgressWidget(
        state: state is LoadingAddProductState ? true : false,
        child: Padding(
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
                      productName = value ?? "";
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
                      productCode = value?.toLowerCase() ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    inputType: TextInputType.number,
                    hintText: "صلاحية المنتج بالسنة",
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
                    hintText: "الكمية بالكيلو",
                    onSaved: (value) {
                      quantity = int.parse(value!);
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    hintText: "وصف المنتج",
                    onSaved: (value) {
                      productDescrition = value ?? "";
                    },
                    maxLines: 5,
                  ),
                  const SizedBox(height: 8),
                  IsProductOrganic(
                    onChange: (value) {
                      isOrganic = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  ImageField(),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomButton(
                      text: "اضافة",
                      onPressed: () {
                        String imagePath = context
                            .read<GetImageCubit>()
                            .state
                            .image;
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final ProductEntity productEntity = ProductEntity(
                            isOrganicProduct: isOrganic,
                            productName: productName,
                            productPrice: productPrice,
                            productImage: imagePath,
                            productCode: productCode,
                            productDiscription: productDescrition,
                            expirationYears: expirationMonths,
                            numberOfCalories: numberOfCalories,
                            unitAmount: quantity,
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
        ),
      ),
    );
  }

  void triggerAddProductCubit({required ProductEntity productEntity}) {
    context.read<AddProductCubit>().addProduct(productEntity: productEntity);
  }
}
