import 'dart:core';

void main() async {
  Stopwatch stopwatch = Stopwatch()..start();
  print('begin');

  String message = await httpGet('/request');
  print(message);

  String message2 = await httpGetLatest('/async');
  print(message2);

  try {
    String message3 = await httpGetWithError('/error');
    print(message3);
  } on Exception catch (err) {
    print('Catch $err');
  } catch (err) {
    print('Catch Error: $err');
  } finally {
    print('Always Run');
  }

  print('end');

  stopwatch.stop();
  double tiempoTranscurridoEnMS = stopwatch.elapsedMilliseconds.toDouble();
  print('El tiempo transcurrido fue: $tiempoTranscurridoEnMS ms');
}

Future<String> httpGet(String url) async {
  const Duration duration = Duration(milliseconds: 700);
  await Future.delayed(duration);
  return 'Hello World Future';
}

Future<String> httpGetLatest(String url) async {
  const Duration duration = Duration(milliseconds: 200);
  await Future.delayed(duration);
  return 'Hello World Async';
}

Future<String> httpGetWithError(String url) async {
  const Duration duration = Duration(seconds: 1);
  await Future.delayed(duration);
  throw Exception('Invalid Request');
}
