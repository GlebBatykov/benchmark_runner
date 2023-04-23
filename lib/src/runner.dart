part of benchmark_runner;

class BenchmarkIteration<T extends Benchmark> {
  final T benchmark;

  BenchmarkIteration({required this.benchmark});
}

class BenchmarkRunner {
  const BenchmarkRunner();

  Future<BenchmarkResult<T>> runAsync<T>({
    required List<AsyncBenchmark<T>> benchmarks,
  }) async {
    final values = <T>[];

    final times = <int>[];

    final memories = <int>[];

    final stopwatch = Stopwatch();

    var memory = 0;

    for (var i = 0; i < benchmarks.length; i++) {
      stopwatch.start();

      memory = ProcessInfo.currentRss;

      final value = await benchmarks[i].run();

      stopwatch.stop();

      memory = ProcessInfo.currentRss - memory;

      values.add(value);
      times.add(stopwatch.elapsedMicroseconds);
      memories.add(memory);

      if (i < benchmarks.length - 1) {
        stopwatch.reset();
      }
    }

    final avarageTime = times.avarage();

    final avarageMemory = memories.avarage();

    return BenchmarkResult<T>(
      time: BenchmarkTime.fromMicroseconds(microseconds: avarageTime),
      memory: BenchmarkMemory.fromBytes(bytes: avarageMemory),
      times: times
          .map((e) => BenchmarkTime.fromMicroseconds(microseconds: e))
          .toList(),
      memories:
          memories.map((e) => BenchmarkMemory.fromBytes(bytes: e)).toList(),
      values: values,
    );
  }

  BenchmarkResult<T> runSync<T>({
    required List<SyncBenchmark<T>> benchmarks,
  }) {
    final values = <T>[];

    final times = <int>[];

    final memories = <int>[];

    final stopwatch = Stopwatch();

    var memory = 0;

    for (var i = 0; i < benchmarks.length; i++) {
      stopwatch.start();

      memory = ProcessInfo.currentRss;

      final value = benchmarks[i].run();

      stopwatch.stop();

      memory = ProcessInfo.currentRss - memory;

      values.add(value);
      times.add(stopwatch.elapsedMicroseconds);
      memories.add(memory);

      if (i < benchmarks.length - 1) {
        stopwatch.reset();
      }
    }

    final avarageTime = times.avarage();

    final avarageMemory = memories.avarage();

    return BenchmarkResult<T>(
      time: BenchmarkTime.fromMicroseconds(microseconds: avarageTime),
      memory: BenchmarkMemory.fromBytes(bytes: avarageMemory),
      times: times
          .map((e) => BenchmarkTime.fromMicroseconds(microseconds: e))
          .toList(),
      memories:
          memories.map((e) => BenchmarkMemory.fromBytes(bytes: e)).toList(),
      values: values,
    );
  }
}
