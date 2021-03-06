import 'package:flutter_template/entity/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterRepository =
    Provider.autoDispose<CounterRepository>((ref) => null);

abstract class CounterRepository {
  Future<Counter> getCounter();

  Future<void> saveCounter(Counter counter);
}
