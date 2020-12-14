void main() {
  const ages = [12, 14, 17];
  List myList = List();
  // List myList = [11, 21, 31];
  // print(myList[0]);

  myList = [11, 21, 31];
  myList.addAll(ages);
  myList.add(41);

  // print(myList.indexOf(21));
  // print(myList.length);
  // print(myList);

  // for (int i = 0; i < 10; i++) {
  //   print(i);
  // }

  // int i = 10;

  // while (i > 5) {
  //   print(i);
  //   i--;
  // }

  // for (var each in ages) {
  //   print(each);
  // }

  List<int> intList = <int>[100, 200, 300];
  intList.add(33);

  List<double> doubleList = [200.15, 300.2];
  List<String> stringlist = ["ktm", "pkh"];
  stringlist.add("brt");

  List<List<String>> nestedList = List();
  nestedList.add(stringlist);
  nestedList.add(stringlist);

  print(nestedList);
}
