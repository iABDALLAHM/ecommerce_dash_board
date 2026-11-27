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
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          showSnackBar(
            context,
            message: LocaleKeys.addProduct_messages_success.tr(),
          );
          context.pop();
        } else if (state is FailureAddProductState) {
          showSnackBar(context, message: state.errorMessage.tr());
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
                    Text(
                      LocaleKeys.addProduct_imageTitle.tr(),
                      style: AppStyles.textStyle13Bold,
                    ),
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
                              Text(LocaleKeys.addProduct_nameAr.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: LocaleKeys.addProduct_nameArHint.tr(),
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
                              Text(LocaleKeys.addProduct_nameEn.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: LocaleKeys.addProduct_nameEnHint.tr(),
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
                              Text(LocaleKeys.addProduct_price.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,
                                hintText: LocaleKeys.addProduct_priceHint.tr(
                                  namedArgs: {'price': '30'},
                                ),
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
                              Text(LocaleKeys.addProduct_sku.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                hintText: LocaleKeys.addProduct_skuHint.tr(),
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
                              Text(LocaleKeys.addProduct_expiration.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,

                                hintText: LocaleKeys.addProduct_expirationHint
                                    .tr(namedArgs: {'months': '1'}),
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
                              Text(LocaleKeys.addProduct_calories.tr()),
                              const SizedBox(height: 6),
                              CustomTextFormField(
                                inputType: TextInputType.number,

                                hintText: LocaleKeys.addProduct_caloriesHint.tr(
                                  namedArgs: {'calories': '350'},
                                ),
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
                    Text(LocaleKeys.addProduct_quantity.tr()),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      inputType: TextInputType.number,

                      hintText: LocaleKeys.addProduct_quantityHint.tr(
                        namedArgs: {'quantity': '100'},
                      ),
                      onSaved: (value) {
                        quantity = int.parse(value!);
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(LocaleKeys.addProduct_description.tr()),
                    const SizedBox(height: 6),
                    CustomTextFormField(
                      maxLines: 4,
                      hintText: LocaleKeys.addProduct_descriptionHint.tr(),
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
                                message: LocaleKeys
                                    .addProduct_messages_imageRequired
                                    .tr(),
                              );
                            }
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            showSnackBar(
                              context,
                              message: LocaleKeys
                                  .addProduct_messages_fieldsRequired
                                  .tr(),
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
