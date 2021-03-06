import 'package:flutter_template/entity/counter.dart';
import 'package:flutter_template/provider/counter_provider.dart';
import 'package:flutter_template/repository/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'repository/counter_repository_dummy.dart';

void main() {
  group('test provider of counter:', () {
    final container = ProviderContainer(
      overrides: [
        counterRepository.overrideWithProvider(
          Provider.autoDispose(
            (ref) => CounterRepositoryImplDummy(),
          ),
        ),
        counterState.overrideWithProvider(
          StateProvider<Counter>((ref) => null),
        )
      ],
    );
    test('initial value of counter count 0', () async {
      expect(container.read(counterState).state, null);
    });

    test('initial load is counter count 0', () async {
      container.read(counterViewController).initState();
      await Future.delayed(Duration(milliseconds: 100));
      expect(container.read(counterState).state.count, 0);
    });

    test('count up first count', () async {
      container.read(counterViewController).countUp();
      expect(container.read(counterState).state.count, 1);
    });

    test('count up second count', () async {
      container.read(counterViewController).countUp();
      expect(container.read(counterState).state.count, 2);
    });

    test('dispose', () async {
      container.read(counterViewController).dispose();
      expect(container.read(counterState).state.count, 0);
    });
  });
}
