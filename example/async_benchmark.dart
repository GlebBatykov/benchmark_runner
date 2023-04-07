import 'package:benchmark_runner/src/benchmark_runner.dart';

class FutureDelayBenchmark extends AsyncBenchmark<void> {
  @override
  Future<void> run() => Future.delayed(const Duration(seconds: 1));
}

void main() async {
  final runner = BenchmarkRunner();

  final benchmark = FutureDelayBenchmark();

  final result = await runner.runAsync(benchmark);

  print(result);
}
