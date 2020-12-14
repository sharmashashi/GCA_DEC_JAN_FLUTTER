void main() {
  // Students students = Students();
  // students.init();
  print(Students.init());
}

class Students {
  static double rate;
  static bool init() {
    print("initializing...");
    rate = 5.99;
    // _finish();
    return true;
  }

  void _finish() {
    print("Finish");
  }

  set setVal(String arg) 
  {
    
  }
  get getVal => rate;
}
