import 'package:benchmark_runner/benchmark_runner.dart';

class ListAddBenchmark extends SyncBenchmark<void> {
  final List<int> other;

  ListAddBenchmark(this.other);

  @override
  void run() {
    final list = <int>[];

    for (var i = 0; i < other.length; i++) {
      list.add(other[i]);
    }
  }
}

void main() {
  final runner = BenchmarkRunner();

  final benchmark = ListAddBenchmark(List.generate(1000, (index) => index));

  final result = runner.runSync(benchmark);

  print(result);
}
