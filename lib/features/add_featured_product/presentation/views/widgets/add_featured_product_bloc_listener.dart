import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_state.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddFeaturedProductBlocListener extends StatelessWidget {
  const AddFeaturedProductBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddFeaturedProductCubit, AddFeaturedProductState>(
      listener: (context, state) {
        if (state is SuccessAddFeaturedProductState) {
          showSnackBar(
            context,
            message: LocaleKeys.addFeaturedProduct_messages_success.tr(),
          );
          context.pop();
        } else if (state is FailureAddFeaturedProductState) {
          showSnackBar(context, message: state.errorMessage.tr());
        }
      },
      child: child,
    );
  }
}
