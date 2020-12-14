void main() {
  Map myMap = {"id": "101", "name": "john"};

  // print(myMap);

  // print(myMap["name"]);

  myMap["address"] = "Ktm";
  print(myMap);
  // myMap["address"] = "Brt";
  // print(myMap);

  // print(myMap.containsKey("id"));
  // print(myMap.containsKey("address"));

  // myMap.remove("address");
  // print(myMap);

  Map<String, dynamic> fixedTypeMap = {"name": "John", "age": 29};
  Map<String, dynamic> userInfo = {
    "address": [12, 13, 14, {}]
  };
}
