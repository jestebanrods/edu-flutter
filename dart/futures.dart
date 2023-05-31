void main() {
  Stopwatch stopwatch = Stopwatch()..start();
  print('begin');

  httpGet('/request').then((String value) {
    print(value);
  });

  httpGetLatest('/async').then((String value) {
    print(value);
  });

  httpGetWithError('/error').then((String value) {
    print(value);
  }).catchError((err) {
    print('Catch Error: $err');
    stopwatch.stop();
    double tiempoTranscurridoEnMS = stopwatch.elapsedMilliseconds.toDouble();
    print('El tiempo transcurrido fue: $tiempoTranscurridoEnMS ms');
  });

  print('end');
}

Future<String> httpGet(String url) {
  const Duration duration = Duration(milliseconds: 700);

  return Future.delayed(duration, () {
    return 'Hello World Future';
  });
}

Future<String> httpGetLatest(String url) {
  const Duration duration = Duration(milliseconds: 200);

  return Future.delayed(duration, () {
    return 'Hello World Async';
  });
}

Future<String> httpGetWithError(String url) {
  const Duration duration = Duration(seconds: 1);

  return Future.delayed(duration, () {
    throw 'Invalid Request';
  });
}
