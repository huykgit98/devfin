import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:devfin/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void bootstrap() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () => runApp(const ProviderScope(child: DevFinApp())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
