import 'package:benchmark_runner/benchmark_runner.dart';

class SimpleBenchmark extends SyncBenchmark<int> {
  final int first;

  final int second;

  SimpleBenchmark({
    required this.first,
    required this.second,
  });

  @override
  int run() => first + second;
}

void main() {
  const runner = BenchmarkRunner();

  final benchmark = SimpleBenchmark(
    first: 1,
    second: 2,
  );

  final result = runner.runSync(benchmarks: [benchmark]);

  print(result);
}
