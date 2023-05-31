void main() {
  emitValues().listen((int event) {
    print('Stream Value: $event');
  });
}

Stream emitNumbers() {
  return Stream.periodic(const Duration(seconds: 1), (int value) {
    return value;
  }).take(5);
}

Stream<int> emitValues() async* {
  final List<int> valuesToEmit = [1, 2, 3, 4, 5];

  for (int value in valuesToEmit) {
    await Future.delayed(Duration(seconds: 1));
    yield value;
  }
}
