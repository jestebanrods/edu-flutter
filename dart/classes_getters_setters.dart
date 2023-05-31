void main() {
  Square square = Square(side: 5.5);
  print('Area Square: ${square.calculateArea()}');

  square = Square();
  square.side = -2;
  print('Area Square: ${square.area}');
}

class Square {
  // INFO: Private Propertis Only Works In Differents Files.
  double _side;

  Square({double side = 0.0})
      : assert(side >= 0, 'side must be granted than zero'),
        _side = side;

  set side(double value) {
    print('setting new value $value');

    if (value < 0) {
      throw 'value must be >= 0';
    }

    _side = value;
  }

  double get area {
    return _side * _side;
  }

  double calculateArea() {
    return _side * _side;
  }
}
