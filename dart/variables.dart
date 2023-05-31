void main() {
  final String digimon = 'Patamon';
  final int hp = 100;
  final bool isAlive = true;
  final bool? power = null;

  final aTypes = ['fire'];
  final bTypes = <String>['fire'];
  final List<String> types = ['fire'];

  dynamic infoMessage = 'Success';
  infoMessage = bool;
  infoMessage = 198;
  infoMessage = null;

  print('''
    $digimon
    $hp
    $isAlive
    $types
    $infoMessage
  ''');

  // Maps {}
  final Map<String, dynamic> digimons = {
    'name': 'Patamon',
    'hp': 100,
    'isAlive': true,
  };

  print(digimons);
  print('Name: ${digimons['name']}');

  // Lists []
  final List<int> numbers = [1, 2, 3, 4, 4, 5, 5, 5, 6, 7, 8, 8, 9];

  print('List: $numbers');
  print('Length: ${numbers.length}');
  print('First: ${numbers.first}');

  // Iterable ().
  final reverseNumbers = numbers.reversed;

  print('Reversed: $reverseNumbers');
  print('List: ${reverseNumbers.toList()}');
  print('Set: ${reverseNumbers.toSet()}'); // Sets Contains Unique Elements.

  final oddNumbers = numbers.where((int element) {
    return (element % 2) == 0;
  });

  print('Odd Numbers: $oddNumbers');
}
