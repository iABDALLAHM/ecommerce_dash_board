import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_orders_and_user_data_cubit.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_orders_and_user_data_states.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/order_card.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersAndUserDataCubit, GetOrdersAndUserDataStates>(
      builder: (context, state) {
        if (state is GetOrdersAndUserDataSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: state.ordersAndUserData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 10,
                  start: 5,
                  end: 5,
                ),
                child: OrderCard(
                  orderAndUserEntity: state.ordersAndUserData[index],
                ),
              );
            },
          );
        } else if (state is GetOrdersAndUserDataLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xff059669)),
          );
        }
        final message = state is GetOrdersAndUserDataFailureState
            ? state.errorMessage.tr()
            : LocaleKeys.orders_empty.tr();
        return Center(child: Text(message, style: AppStyles.textStyle16Bold));
      },
    );
  }
}
