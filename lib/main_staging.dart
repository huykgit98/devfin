import 'package:devfin/app/app.dart';
import 'package:devfin/bootstrap.dart';
import 'package:devfin/firebase_options_stg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await bootstrap(() => const DevFinApp());
}
