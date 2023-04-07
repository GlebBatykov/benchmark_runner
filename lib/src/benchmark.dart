part of benchmark_runner;

abstract class Benchmark<T> {
  FutureOr<T> run();
}

abstract class SyncBenchmark<T> extends Benchmark<T> {
  @override
  T run();
}

abstract class AsyncBenchmark<T> extends Benchmark<T> {
  @override
  Future<T> run();
}
