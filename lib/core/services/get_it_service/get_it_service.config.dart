// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:ecommerce_dash_board/core/modules/register_module.dart'
    as _i610;
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart'
    as _i110;
import 'package:ecommerce_dash_board/core/services/database_service/firestore_service.dart'
    as _i329;
import 'package:ecommerce_dash_board/core/services/notification_sender_service/firebase_notification_sender_service.dart'
    as _i985;
import 'package:ecommerce_dash_board/core/services/notification_sender_service/notification_sender_service.dart'
    as _i819;
import 'package:ecommerce_dash_board/core/services/storage_service/storage_service.dart'
    as _i117;
import 'package:ecommerce_dash_board/core/services/storage_service/supabase_storage_service.dart'
    as _i810;
import 'package:ecommerce_dash_board/features/add_featured_product/data/repositories/featured_products_repository/featured_products_repository_implementation.dart'
    as _i243;
import 'package:ecommerce_dash_board/features/add_featured_product/domain/repositories/featured_products_repository/featured_products_repository.dart'
    as _i374;
import 'package:ecommerce_dash_board/features/add_featured_product/presentation/cubits/add_Featured_product_cubit/add_featured_product_cubit.dart'
    as _i502;
import 'package:ecommerce_dash_board/features/add_notification/data/repositories/notification_repository/notification_repository_implementation.dart'
    as _i146;
import 'package:ecommerce_dash_board/features/add_notification/domain/repositories/notification_repository/notification_repository.dart'
    as _i976;
import 'package:ecommerce_dash_board/features/add_notification/presentation/cubits/add_notification_cubit/add_notification_cubit.dart'
    as _i775;
import 'package:ecommerce_dash_board/features/add_product/data/repositories/images_repository/images_repository_implementation.dart'
    as _i999;
import 'package:ecommerce_dash_board/features/add_product/data/repositories/products_repository/products_repository_implementation.dart'
    as _i116;
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart'
    as _i297;
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/products_repository/products_repostory.dart'
    as _i205;
import 'package:ecommerce_dash_board/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart'
    as _i378;
import 'package:ecommerce_dash_board/features/orders/data/repositories/orders_repository/orders_repository_implementation.dart'
    as _i258;
import 'package:ecommerce_dash_board/features/orders/domain/repositories/orders_repository/orders_repository.dart'
    as _i631;
import 'package:ecommerce_dash_board/features/orders/orders.dart' as _i236;
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/change_order_status_cubit/change_order_status_cubit.dart'
    as _i551;
import 'package:ecommerce_dash_board/features/orders/presentation/cubits/get_stream_orders_cubit/get_stream_orders_cubit.dart'
    as _i169;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i974.FirebaseFirestore>(
      () => registerModule.firebaseFirestore,
    );
    gh.singleton<_i454.Supabase>(() => registerModule.supabase);
    gh.lazySingleton<_i819.NotificationSenderService>(
      () => _i985.FirebaseNotificationSenderService(),
    );
    gh.lazySingleton<_i110.DatabaseService>(
      () => _i329.FirestoreService(firestore: gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i117.StorageService>(
      () => _i810.SupabaseStorageService(supabase: gh<_i454.Supabase>()),
    );
    gh.lazySingleton<_i297.ImagesRepository>(
      () => _i999.ImagesRepositoryImplementation(
        storageService: gh<_i117.StorageService>(),
      ),
    );
    gh.lazySingleton<_i631.OrderRepository>(
      () => _i258.OrdersRepositoryImplementation(
        databaseService: gh<_i110.DatabaseService>(),
      ),
    );
    gh.factory<_i169.GetStreamOrdersCubit>(
      () => _i169.GetStreamOrdersCubit(
        orderRepository: gh<_i236.OrderRepository>(),
      ),
    );
    gh.lazySingleton<_i976.NotificationRepository>(
      () => _i146.NotificationRepositoryImplementation(
        databaseService: gh<_i110.DatabaseService>(),
      ),
    );
    gh.lazySingleton<_i205.ProductsRepostory>(
      () => _i116.ProductsRepositoryImplementation(
        databaseService: gh<_i110.DatabaseService>(),
      ),
    );
    gh.lazySingleton<_i374.FeaturedProductsRepository>(
      () => _i243.FeaturedProductsRepositoryImplementation(
        databaseService: gh<_i110.DatabaseService>(),
      ),
    );
    gh.factory<_i378.AddProductCubit>(
      () => _i378.AddProductCubit(
        imagesRepo: gh<_i297.ImagesRepository>(),
        productsRepo: gh<_i205.ProductsRepostory>(),
      ),
    );
    gh.factory<_i502.AddFeaturedProductCubit>(
      () => _i502.AddFeaturedProductCubit(
        featuredProductRepository: gh<_i374.FeaturedProductsRepository>(),
        imageRepo: gh<_i297.ImagesRepository>(),
      ),
    );
    gh.factory<_i551.ChangeOrderStatusCubit>(
      () => _i551.ChangeOrderStatusCubit(
        orderRepository: gh<_i631.OrderRepository>(),
      ),
    );
    gh.factory<_i775.AddNotificationCubit>(
      () => _i775.AddNotificationCubit(
        notificationRepo: gh<_i976.NotificationRepository>(),
        imagesRepo: gh<_i297.ImagesRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i610.RegisterModule {}
