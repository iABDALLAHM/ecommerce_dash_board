import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> initGetIt() async => await getIt.init();
