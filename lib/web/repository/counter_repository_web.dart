import 'package:flutter_template/client/shared_preferences_client.dart';
import 'package:flutter_template/entity/counter.dart';
import 'package:flutter_template/repository/counter_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterRepositoryImplWeb implements CounterRepository {
  final Reader read;

  CounterRepositoryImplWeb(this.read);

  final _counterKey = 'counter';

  @override
  Future<Counter> getCounter() async {
    final prefs = read(sharedPreferencesClient);
    final counter = Counter();
    counter.count = await prefs.getData(_counterKey) ?? 0;
    return counter;
  }

  @override
  Future<void> saveCounter(Counter counter) async {
    final prefs = read(sharedPreferencesClient);
    await prefs.saveData(_counterKey, counter.count);
  }
}
