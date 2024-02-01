import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:devfin/app/app.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Bloc.observer = AppBlocObserver();

  // await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await initServices();
  // setLocaleMessages('vi', ViMessages());
  // setDefaultLocale('vi');
  runApp(await builder());
}
