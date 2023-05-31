void main() {
  var myAge = 30;
  print('Im $myAge Years Old');

  String myName = 'Jossie';
  print('Hello $myName');

  late final String myLastName;
  myLastName = 'Rodriguez';
  print('Hello Mr. $myLastName');

  const String myNick = 'Yoshi';
  print('Hello $myNick');

  print('Hello ${myNick.toUpperCase()}');
}
