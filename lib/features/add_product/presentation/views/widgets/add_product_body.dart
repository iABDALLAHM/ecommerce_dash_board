import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_state.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_dash_board/features/add_product/add_product.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/custom_add_product_button.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/get_product_image_card.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/widgets/switch_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isFeatured = false;
  bool isOrganic = false;
  String productNameAr = "";
  String productNameEn = "";
  String? productImage;

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
      builder: (context, state) {
        return CustomProgressWidget(
          state: state is LoadingAddProductState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text("صورة المنتج", style: AppStyles.textStyle13Bold),
                    const SizedBox(height: 10),
                    BlocListener<GetImageCubit, GetImageState>(
                      listener: (context, state) {
                        if (state is GetImageSuccessState) {
                          productImage = state.imagePath;
                        }
                      },
                      child: GetProductImageCard(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("الاسم بالعربي"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: "مثال: فراولة",
                                onSaved: (value) {
                                  productNameAr = value ?? "";
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("الاسم بالإنجليزي"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: "Strawberry",
                                onSaved: (value) {
                                  productNameEn = value ?? "";
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("سعر المنتج (جنيه)"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,
                                hintText: "30",
                                onSaved: (value) {
                                  productPrice = num.parse(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("كود المنتج (SKU)"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: "strw-01",
                                onSaved: (value) {
                                  productCode = value?.toLowerCase() ?? "";
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("الصلاحية (بالأشهر/سنة)"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,

                                hintText: "1 سنة",
                                onSaved: (value) {
                                  expirationMonths = int.parse(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("السعرات الحرارية"),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,

                                hintText: "350 سعرة",
                                onSaved: (value) {
                                  numberOfCalories = int.parse(value!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text("الكمية المتوفرة (بالكيلو)"),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      inputType: TextInputType.number,

                      hintText: "100 كجم",
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                    const SizedBox(height: 16),
                    Text("وصف المنتج"),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      maxLines: 4,
                      hintText: "اكتب تفاصيل ومصدر الفاكهة الطازجة...",
                      onSaved: (value) {
                        productDescrition = value ?? "";
                      },
                    ),
                    const SizedBox(height: 22),
                    SwitchCard(
                      onChange: (value) {
                        isOrganic = value;
                      },
                    ),
                    const SizedBox(height: 44),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomAddProductButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (productImage != null) {
                              final ProductEntity productEntity = ProductEntity(
                                productName: {
                                  "productName_ar": productNameAr
                                      .trim()
                                      .toLowerCase(),
                                  "productName_en": productNameEn
                                      .trim()
                                      .toLowerCase(),
                                },
                                productPrice: productPrice,
                                productImage: productImage!,
                                productCode: productCode,
                                productDiscription: productDescrition,
                                isOrganicProduct: isOrganic,
                                expirationYears: expirationMonths,
                                numberOfCalories: numberOfCalories,
                                unitAmount: quantity,
                              );
                              _triggerAddProduct(
                                context: context,
                                productEntity: productEntity,
                              );
                            } else {
                              showSnackBar(
                                context,
                                message: "املأ صورة المنتج",
                              );
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            showSnackBar(
                              context,
                              message: "املأ الحقول الفارغة",
                            );
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _triggerAddProduct({
    required BuildContext context,
    required ProductEntity productEntity,
  }) {
    context.read<AddProductCubit>().addProduct(productEntity: productEntity);
  }
}
