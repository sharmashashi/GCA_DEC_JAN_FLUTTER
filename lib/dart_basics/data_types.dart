void main() {
  int rollNumber = 5;
  rollNumber = 3;
  // print(rollNumber * 10);

  double rate = 2.99;

  String firstName = "Joh'n";
  // print(firstName);
  firstName = 'Ram';
  // print(firstName);

  String price = "99";
  int modifiedPrice = int.parse(price);
  // print(modifiedPrice);

  String newRate = "2.5";
  double modifiedNewRate = double.parse("2.5");

  String message = "Rate has been changed to $rate";
  // print(message);

  String newMessage = "Rate has been changed to ${rate + 1}";
  // print(newMessage);

  var value = "value";
  // print(value);

  final number = 1;

  const pi = 3.14;

  bool isEven = true;
  isEven = !isEven;
  print(isEven);
}
