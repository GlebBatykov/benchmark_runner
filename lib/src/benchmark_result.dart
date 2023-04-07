part of benchmark_runner;

class BenchmarkResult<T> {
  final BenchmarkMemory memory;

  final BenchmarkTime time;

  final List<BenchmarkTime> times;

  final List<BenchmarkMemory> memories;

  final List<T> values;

  BenchmarkResult({
    required this.memory,
    required this.time,
    required this.times,
    required this.memories,
    required this.values,
  });
}
