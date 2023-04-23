part of benchmark_runner;

typedef BenchmarkCallback = void Function();

typedef BenchmarkCallbackAync = Future<void> Function();

int measureNanoseconds(BenchmarkCallback callback) {
  final stopwatch = Stopwatch()..start();

  callback();

  stopwatch.stop();

  return stopwatch.elapsedMicroseconds * 1000;
}

Future<int> measureNanosecondsAsync(BenchmarkCallbackAync callback) async {
  final stopwatch = Stopwatch()..start();

  await callback();

  stopwatch.stop();

  return stopwatch.elapsedMicroseconds * 1000;
}

int measureMicroseconds(BenchmarkCallback callback) {
  final stopwatch = Stopwatch()..start();

  callback();

  stopwatch.stop();

  return stopwatch.elapsedMicroseconds;
}

Future<int> measureMicrosecondsAsync(BenchmarkCallbackAync callback) async {
  final stopwatch = Stopwatch()..start();

  await callback();

  stopwatch.stop();

  return stopwatch.elapsedMicroseconds;
}

int measureMilliseconds(BenchmarkCallback callback) {
  final stopwatch = Stopwatch()..start();

  callback();

  stopwatch.stop();

  return stopwatch.elapsedMilliseconds;
}

Future<int> measureMillisecondsAsync(BenchmarkCallbackAync callback) async {
  final stopwatch = Stopwatch()..start();

  await callback();

  stopwatch.stop();

  return stopwatch.elapsedMilliseconds;
}

int measureSeconds(BenchmarkCallback callback) {
  final stopwatch = Stopwatch()..start();

  callback();

  stopwatch.stop();

  return stopwatch.elapsedMilliseconds ~/ 1000;
}

Future<int> measureSecondAsync(BenchmarkCallbackAync callback) async {
  final stopwatch = Stopwatch()..start();

  await callback();

  stopwatch.stop();

  return stopwatch.elapsedMilliseconds ~/ 1000;
}
