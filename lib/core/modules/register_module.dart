import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class RegisterModule {
  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @singleton
  Supabase get supabase => Supabase.instance;
}
