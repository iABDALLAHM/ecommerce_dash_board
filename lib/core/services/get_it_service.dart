import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repos/images_repo/images_repo.dart';
import 'package:ecommerce_dash_board/features/add_product/data/repos/images_repo_implementation/images_repo_implementation.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/features/add_notification/data/repos/notification_repo_implementation/notification_repo_implementation.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repos/products_repo/products_repo.dart';
import 'package:ecommerce_dash_board/features/add_product/data/repos/products_repo_implementation/products_repo_implementation.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/services/firestore_service.dart';
import 'package:ecommerce_dash_board/core/services/storage_service.dart';
import 'package:ecommerce_dash_board/core/services/supabase_storage_service.dart';
import 'package:ecommerce_dash_board/features/orders/data/repos/orders_repository_implementation.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repos/orders_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GetIt getIt = GetIt.instance;
void initGetIt() {
  getIt.registerSingleton<DatabaseService>(
    FirestoreService(firestore: FirebaseFirestore.instance),
  );

  getIt.registerSingleton<StorageService>(
    SupabaseStorageService(supabase: Supabase.instance),
  );

  getIt.registerSingleton<OrderRepository>(
    OrdersRepositoryImplementation(databaseService: getIt<DatabaseService>()),
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
