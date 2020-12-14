String version = "1.0.0";
void main() {
  // displayPositional("apple", 120);
  // displayNamed(price: 120, itemName: "apple");
  // displayOptional("apple", 120);
  // displayPositionalAndNamed("orange", price: 190);

  // double price = calculatePrice(price: 99);
  // print(price);
  print(getUser());
}

Map<String, dynamic> getUser() => {"name": "John", "age": 30};

double calculatePrice({double price}) {
  double incrAmount = 9.99;
  double newAmount = price + 9.99;
  return newAmount;
}

void displayPositional(String itemName, double price) {
  print("Price of $itemName is $price per KG");
}

void displayNamed({String itemName, double price}) {
  print("Price of $itemName is $price per KG");
}

void displayOptional([String itemName, double price]) {
  print("Price of $itemName is $price per KG");
}

void displayPositionalAndNamed(String itemName, {double price}) {
  print("Price of $itemName is $price per KG");
}
