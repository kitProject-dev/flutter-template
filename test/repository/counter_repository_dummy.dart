import 'package:flutter_template/entity/counter.dart';
import 'package:flutter_template/repository/counter_repository.dart';

class CounterRepositoryImplDummy implements CounterRepository {
  Counter inMemoryCounter = Counter();

  @override
  Future<Counter> getCounter() async {
    return inMemoryCounter;
  }

  @override
  Future<void> saveCounter(Counter counter) async {
    inMemoryCounter = counter;
  }
}
