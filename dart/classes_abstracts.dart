void main() {
  final Developer backend = Developer(name: 'Jossie');
  final Designer designer = Designer(name: 'Esteban');
  final ProductManager pm = ProductManager(name: 'Luisa');

  greetPerson(backend);
  greetPerson(designer);
  greetPerson(pm);
}

void greetPerson(Person person) {
  person.greet();
}

enum Genre { male, female }

abstract class Person {
  String name;
  final Genre genre;

  Person({required this.name, required this.genre});

  void greet();
}

class Developer extends Person {
  Developer({required super.name, super.genre = Genre.male});

  @override
  void greet() {
    print('Hello $name, Im $genre');
  }
}

class Designer extends Person {
  Designer({required String name}) : super(name: name, genre: Genre.male);

  @override
  void greet() {
    print('Hello $name, Im $genre');
  }
}

class ProductManager implements Person {
  @override
  String name;

  @override
  final Genre genre = Genre.female;

  ProductManager({required String this.name});

  @override
  void greet() {
    print('Miss $name');
  }
}
