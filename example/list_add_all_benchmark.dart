import 'package:benchmark_runner/benchmark_runner.dart';

class ListAddAllBenchmark extends SyncBenchmark<void> {
  final List<int> other;

  ListAddAllBenchmark(this.other);

  @override
  void run() {
    final list = <int>[];

    list.addAll(other);
  }
}

void main() {
  final runner = BenchmarkRunner();

  final benchmark = ListAddAllBenchmark(List.generate(1000, (index) => index));

  final result = runner.runSync(benchmark);

  print(result);
}
