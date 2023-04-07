part of benchmark_runner;

extension NumListExtension on List<int> {
  int avarage() {
    var value = 0;

    for (var i = 0; i < length; i++) {
      value += this[i];
    }

    value = value ~/ length;

    return value;
  }
}
