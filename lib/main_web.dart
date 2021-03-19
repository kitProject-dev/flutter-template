import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/repository/counter_repository.dart';
import 'package:flutter_template/web/repository/counter_repository_web.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      overrides: [
        counterRepository.overrideWithProvider(
            Provider.autoDispose((ref) => CounterRepositoryImplWeb(ref.read)))
      ],
      child: MyApp(),
    ),
  );
}
