part of benchmark_runner;

abstract class Benchmark<T> {
  const Benchmark();

  FutureOr<T> run();
}

abstract class SyncBenchmark<T> extends Benchmark<T> {
  const SyncBenchmark();

  @override
  T run();
}

abstract class AsyncBenchmark<T> extends Benchmark<T> {
  const AsyncBenchmark();

  @override
  Future<T> run();
}
