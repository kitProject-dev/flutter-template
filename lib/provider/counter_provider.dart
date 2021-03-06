import 'package:flutter_template/entity/counter.dart';
import 'package:flutter_template/repository/counter_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterState = StateProvider.autoDispose<Counter>((ref) => null);

final counterViewController =
    Provider.autoDispose((ref) => CounterViewController(ref.read));

class CounterViewController {
  final Reader read;

  CounterViewController(this.read);

  void initState() async {
    read(counterState).state = await read(counterRepository).getCounter();
  }

  void dispose() {
    final counter = read(counterState).state;
    counter.count = 0;
  }

  void countUp() async {
    final counter = read(counterState).state;
    counter.count = counter.count + 1;
    await read(counterRepository).saveCounter(counter);
    read(counterState).state = counter;
  }
}
