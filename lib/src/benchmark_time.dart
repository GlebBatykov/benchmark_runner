part of benchmark_runner;

class BenchmarkTime {
  final int microseconds;

  final double asMilliseconds;

  final double asSeconds;

  final double asMinutes;

  final double asHours;

  BenchmarkTime.fromMicroseconds({
    required this.microseconds,
  })  : asMilliseconds = microseconds / 1000,
        asSeconds = microseconds / 1000000,
        asMinutes = microseconds / 60000000,
        asHours = microseconds / 3600000000;
}
