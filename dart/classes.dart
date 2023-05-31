void main() {
  final Hero5 spiderman = Hero5(name: 'Spiderman', power: 'Telaraña');
  print(spiderman);

  final Map<String, dynamic> rawJson = {
    'name': 'Ironman',
    'power': 'Flight',
    'is_alive': true
  };

  final Hero5 ironman = Hero5.fromJson(rawJson);
  print(ironman);
}

class Hero {
  String? name;
  String? power;

  Hero(String pName, String pPower) {
    this.name = pName;
    this.power = pPower;
  }
}

class Hero2 {
  String name;
  String power;

  Hero2(String pName, String pPower)
      : name = pName,
        power = pPower;
}

class Hero3 {
  String name;
  String power;

  Hero3(this.name, this.power);
}

class Hero4 {
  String name;
  String power;

  Hero4({required this.name, this.power = '...'});

  @override
  String toString() {
    return '$name -> $power';
  }
}

class Hero5 {
  String name;
  String power;
  bool isAlive;

  Hero5({required this.name, required this.power, this.isAlive = false});

  Hero5.fromJson(Map<String, dynamic> input)
      : name = input['name'] ?? 'No name found',
        power = input['power'] ?? 'No power found',
        isAlive = input['is_alive'] ?? false;

  @override
  String toString() {
    return '$name -> $power, ${isAlive ? 'OK' : 'NaN'}';
  }
}
