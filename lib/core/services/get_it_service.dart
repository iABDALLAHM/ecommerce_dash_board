import 'package:ecommerce_dash_board/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_dash_board/core/repos/images_repo/images_repo_implementation.dart';
import 'package:ecommerce_dash_board/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/core/repos/notification_repo/notification_repo_implementation.dart';
import 'package:ecommerce_dash_board/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_dash_board/core/repos/products_repo/products_repo_implementation.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/services/firestore_service.dart';
import 'package:ecommerce_dash_board/core/services/storage_service.dart';
import 'package:ecommerce_dash_board/core/services/supabase_storage_service.dart';
import 'package:ecommerce_dash_board/features/orders/data/repos/orders_repo_implementation.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void initGetIt() {
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImplementation(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<NotificationRepo>(
    NotificationRepoImplementation(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImplementation(databaseService: getIt<DatabaseService>()),
  );
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImplementation(storageService: getIt<StorageService>()),
  );
}
