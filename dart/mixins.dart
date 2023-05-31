void main() {
  final Bat bat = Bat();

  bat.fly();
  bat.walk();
}

abstract class Animal {}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

abstract class Flyer {
  void fly() => print('flying');
}

abstract class Walker {
  void walk() => print('walking');
}

abstract class Swimmer {
  void swim() => print('swiming');
}

class Dolphin extends Mammal with Swimmer {}

class Bat extends Mammal with Flyer, Walker {}

class Cat extends Mammal with Walker {}
