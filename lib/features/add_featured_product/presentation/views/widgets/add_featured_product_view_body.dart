import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/core/widgets/image_field.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_state.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/views/widgets/add_featured_product_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeaturedProductViewBody extends StatelessWidget {
  const AddFeaturedProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AddFeaturedProductBlocListener(
      child: BlocBuilder<AddFeaturedProductCubit, AddFeaturedProductState>(
        builder: (context, state) {
          return CustomProgressWidget(
            state: state is LoadingAddFeaturedProductState,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageField(),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 59,
                    width: double.infinity,
                    child: CustomButton(
                      text: "إضافة",
                      onPressed: () {
                        var image = context.read<GetImageCubit>().state.image;
                        final FeaturedProductEntity featuredProductEntity =
                        
                            FeaturedProductEntity(image: image, id: "324234");
                        context
                            .read<AddFeaturedProductCubit>()
                            .addFeaturedProduct(product: featuredProductEntity);
                      },
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
