import 'package:flutter/material.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/repository/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'repository/counter_repository_dummy.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          counterRepository.overrideWithProvider(
            Provider.autoDispose(
              (ref) => CounterRepositoryImplDummy(),
            ),
          )
        ],
        child: MyApp(),
      ),
    );
    expect(find.text('Loading'), findsOneWidget);
    await tester.pump(Duration(milliseconds: 100));
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
