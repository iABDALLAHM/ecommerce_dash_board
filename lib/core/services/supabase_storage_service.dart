import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  final Supabase supabase;
  SupabaseStorageService({required this.supabase});

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    try {
      var fileName = b.basename(file.path);
      await supabase.client.storage
          .from(kBucketName)
          .upload("$path/$fileName", file);

      var imageUrl = supabase.client.storage
          .from(kBucketName)
          .getPublicUrl("$path/$fileName");
      return imageUrl;
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "فشل رفع الملف إلى التخزين السحابي، حاول مرة أخرى",
      );
    }
  }
}
