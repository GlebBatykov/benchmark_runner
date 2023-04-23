import 'package:benchmark_runner/benchmark_runner.dart';

class ListAddAllThreeDotsBenchmark extends SyncBenchmark<void> {
  final List<int> other;

  ListAddAllThreeDotsBenchmark(this.other);

  @override
  void run() {
    <int>[...other];
  }
}

void main() {
  const runner = BenchmarkRunner();

  final benchmark = ListAddAllThreeDotsBenchmark(
    List.generate(1000000, (index) => index),
  );

  final result = runner.runSync(benchmarks: [benchmark]);

  print(result.time.microseconds);
}
