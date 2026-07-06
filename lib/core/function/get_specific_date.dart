import 'package:ecommerce_dash_board/core/function/get_month.dart';

String getSpecificDate({required DateTime date}) {
  return "${date.day} ${getMonth(month: date.month)} , ${date.year}";
}
