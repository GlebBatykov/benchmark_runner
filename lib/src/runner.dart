part of benchmark_runner;

class BenchmarkRunner {
  Future<BenchmarkResult<T>> runAsync<T>(
    AsyncBenchmark<T> benchmark, {
    int iterations = 1,
  }) async {
    final values = <T>[];

    final times = <int>[];

    final memories = <int>[];

    final stopwatch = Stopwatch();

    var memory = 0;

    for (var i = 0; i < iterations; i++) {
      stopwatch.start();

      memory = ProcessInfo.currentRss;

      final value = await benchmark.run();

      stopwatch.stop();

      memory = ProcessInfo.currentRss - memory;

      values.add(value);
      times.add(stopwatch.elapsedMicroseconds);
      memories.add(memory);

      if (i < iterations - 1) {
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

  BenchmarkResult<T> runSync<T>(
    SyncBenchmark<T> benchmark, {
    int iterations = 1,
  }) {
    final values = <T>[];

    final times = <int>[];

    final memories = <int>[];

    final stopwatch = Stopwatch();

    var memory = 0;

    for (var i = 0; i < iterations; i++) {
      stopwatch.start();

      memory = ProcessInfo.currentRss;

      final value = benchmark.run();

      stopwatch.stop();

      memory = ProcessInfo.currentRss - memory;

      values.add(value);
      times.add(stopwatch.elapsedMicroseconds);
      memories.add(memory);

      if (i < iterations - 1) {
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
