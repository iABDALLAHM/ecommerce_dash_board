import 'dart:io';
import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/services/storage_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  Supabase supabase = Supabase.instance;
  @override
  Future<String> uploadFile({required File file, required String path}) async {
    var fileName = b.basename(file.path);
    await supabase.client.storage
        .from(kBucketName)
        .upload("$path/$fileName", file);

    var publicUrl = supabase.client.storage
        .from(kBucketName)
        .getPublicUrl("$path/$fileName");
    return publicUrl;
  }
}
