part of benchmark_runner;

class BenchmarkMemory {
  final int bits;

  final int bytes;

  final double asKilobytes;

  final double asMegabytes;

  final double asGigabytes;

  BenchmarkMemory.fromBytes({
    required this.bytes,
  })  : bits = bytes * 8,
        asKilobytes = bytes / 1024,
        asMegabytes = bytes / 1048576,
        asGigabytes = bytes / 1073741824;
}
