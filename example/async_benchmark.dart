import 'package:benchmark_runner/benchmark_runner.dart';

class FutureDelayBenchmark extends AsyncBenchmark<void> {
  @override
  Future<void> run() => Future.delayed(const Duration(seconds: 1));
}

void main() async {
  const runner = BenchmarkRunner();

  final benchmark = FutureDelayBenchmark();

  final result = await runner.runAsync(benchmarks: [benchmark]);

  print(result);
}
