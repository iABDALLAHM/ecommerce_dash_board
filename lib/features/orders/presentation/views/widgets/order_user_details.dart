import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/entities/user_entity/user_entity.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderUserDetails extends StatelessWidget {
  const OrderUserDetails({super.key, required this.userEntity});
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffE2E8F0)),
        color: Color(0xffF8FAFC),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xff6EE7B7),
            radius: 30,
            child: CircleAvatar(
              backgroundColor: const Color(0xffD1FAE5),
              radius: 28,
              child: ClipOval(
                child: Image.network(
                  userEntity.userImage,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.person, color: Color(0xff059669)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.orders_user_orderFrom.tr(),
                style: TextStyle(fontSize: 11, color: Color(0xff94A3B8)),
              ),
              Row(
                children: [
                  Text(
                    "${LocaleKeys.orders_user_name.tr()}: ",
                    style: AppStyles.textStyle13Bold,
                  ),
                  Text(
                    userEntity.name,
                    style: AppStyles.textStyle13Bold.copyWith(
                      color: Color(0xff047857),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${LocaleKeys.common_email.tr()}: ",
                    style: TextStyle(fontSize: 11, color: Color(0xff64748B)),
                  ),
                  Text(
                    userEntity.email,
                    style: TextStyle(fontSize: 12, color: Color(0xff475569)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
