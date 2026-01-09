import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log("✨ onChange: ${bloc.runtimeType} | $change");
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log("❌ onClose: ${bloc.runtimeType}");
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log("🎉 onCreate: ${bloc.runtimeType}");
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    log("✅ onDone: ${bloc.runtimeType} | event: $event");
    if (error != null) {
      log("⚠️ error: $error");
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("💥 onError: ${bloc.runtimeType} | error: $error");
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log("📣 onEvent: ${bloc.runtimeType} | event: $event");
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    log("🔄 onTransition: ${bloc.runtimeType} | $transition");
  }
}
