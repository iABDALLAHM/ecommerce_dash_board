import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/data/repositories/featured_products_repository/featured_products_repository_implementation.dart';
import 'package:ecommerce_dash_board/features/add_featured_product/domain/repositories/featured_products_repository/featured_products_repository.dart';
import 'package:ecommerce_dash_board/features/add_notification/data/repositories/notification_repository/notification_repository_implementation.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_dash_board/features/add_product/data/repositories/images_repository/images_repository_implementation.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/products_repository/products_repostory.dart';
import 'package:ecommerce_dash_board/features/add_product/data/repositories/products_repository/products_repository_implementation.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/services/database_service/firestore_service.dart';
import 'package:ecommerce_dash_board/core/services/storage_service/storage_service.dart';
import 'package:ecommerce_dash_board/core/services/storage_service/supabase_storage_service.dart';
import 'package:ecommerce_dash_board/features/orders/data/repositories/orders_repository/orders_repository_implementation.dart';
import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart';
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

  getIt.registerSingleton<NotificationRepository>(
    NotificationRepositoryImplementation(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<ProductsRepostory>(
    ProductsRepositoryImplementation(databaseService: getIt<DatabaseService>()),
  );

  getIt.registerSingleton<ImagesRepository>(
    ImagesRepositoryImplementation(storageService: getIt<StorageService>()),
  );
  
  getIt.registerSingleton<FeaturedProductsRepository>(
    FeaturedProductsRepositoryImplementation(databaseService: getIt<DatabaseService>()),
  );
}

