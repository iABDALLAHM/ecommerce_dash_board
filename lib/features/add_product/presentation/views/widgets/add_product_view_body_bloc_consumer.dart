import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_progress_widget.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductStates>(
      builder: (context, state) => CustomProgressWidget(
        state: state is LoadingAddProductState ? true : false,
        child: child,
      ),
      listener: (context, state) {
        if (state is SuccessAddProductState) {
          showSnackBar(context, message: "تم اضافة المنتج بنجاح");
          Navigator.of(context).pop();
        } else if (state is FailureAddProductState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
    );
  }
}
