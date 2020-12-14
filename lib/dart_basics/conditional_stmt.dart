void main() {
  int num1 = 2;
  int num2 = 3;
  // if (num1 == num2) {
  //   print("true");
  // } else if (num1 > num2) {
  //   print("greater");
  // } else if (num2 > num1) {
  //   print("smaller");
  // }

  bool isEven = true;
  // if (isEven) {
  //   print(isEven);
  // }

  if ((num1 < num2) && isEven) {
    print((num1 > num2) && isEven);
    print((num1 > num2) || isEven);
  }
}
