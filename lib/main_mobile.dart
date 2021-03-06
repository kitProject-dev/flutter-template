import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/mobile/repository/counter_repository_mobile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'repository/counter_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        counterRepository.overrideWithProvider(Provider.autoDispose(
            (ref) => CounterRepositoryImplMobile(ref.read)))
      ],
      child: MyApp(),
    ),
  );
}
