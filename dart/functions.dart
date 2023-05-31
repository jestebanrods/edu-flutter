void main() {
  String message = greetEveryone();
  print(message);

  message = greetDeveloper();
  print(message);

  print('Suma: ${sum(1, 5)}');
  print('SumaOptional: ${sumOptional(1)}');

  print('Greet: ${greetPerson(name: 'Jossie', message: 'Hi,')}');
}

String greetEveryone() {
  return 'Hello Everyone';
}

// Lambda Functions.
String greetDeveloper() => 'Hello Jossie';

int sum(int a, int b) => a + b;

// Fixed Arguments.
int sumOptional(int a, [int b = 0, int? c]) {
  c ??= 5;
  return a + b + c;
}

// Positional Arguments.
String greetPerson({required String name, String message = 'Hello,'}) {
  return '$message $name';
}
