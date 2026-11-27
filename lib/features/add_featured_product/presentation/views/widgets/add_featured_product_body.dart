import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_state.dart';
import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_state.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/views/widgets/add_featured_product_bloc_listener.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/views/widgets/get_featured_product_image.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeaturedProductBody extends StatefulWidget {
  const AddFeaturedProductBody({super.key});

  @override
  State<AddFeaturedProductBody> createState() => _AddFeaturedProductBodyState();
}

class _AddFeaturedProductBodyState extends State<AddFeaturedProductBody> {
  String? featuredProductImage;
  @override
  Widget build(BuildContext context) {
    return AddFeaturedProductBlocListener(
      child: BlocBuilder<AddFeaturedProductCubit, AddFeaturedProductState>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingAddFeaturedProductState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    LocaleKeys.addFeaturedProduct_imageTitle.tr(),
                    style: AppStyles.textStyle13Bold,
                  ),
                  const SizedBox(height: 8),
                  BlocListener<GetImageCubit, GetImageState>(
                    listener: (context, state) {
                      if (state is GetImageSuccessState) {
                        featuredProductImage = state.imagePath;
                      }
                    },
                    child: GetFeaturedProductImage(),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Color(0xff059669),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (featuredProductImage != null) {
                          FeaturedProductEntity featuredProductEntity =
                              FeaturedProductEntity(
                                image: featuredProductImage!,
                                id: "324234",
                              );
                          context
                              .read<AddFeaturedProductCubit>()
                              .addFeaturedProduct(
                                product: featuredProductEntity,
                              );
                        } else {
                          showSnackBar(
                            context,
                            message: LocaleKeys
                                .addFeaturedProduct_messages_imageRequired
                                .tr(),
                          );
                        }
                      },
                      icon: Icon(Icons.check_rounded),
                      label: Text(
                        LocaleKeys.addFeaturedProduct_publishButton.tr(),
                        style: AppStyles.textStyle16Bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
