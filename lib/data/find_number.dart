class FindNumbers {
  List<int> numbers = [];

  FindNumbers(this.numbers);

  int checkNumber() {
    //even number counter
    int k = 0;
    //odd number counter
    int j = 0;
    int searchNumber = 0;

    for (int i = 0; i < 3; i++) {
      if (numbers[i] % 2 == 0) {
        k++;
      } else if (numbers[i] % 2 == 1) {
        j++;
      }
    }
    if (k > j) {
      for (int i = 0; i < numbers.length; i++) {
        if (numbers[i] % 2 == 1) {
          searchNumber = numbers[i];
        }
      }
    } else {
      for (int i = 0; i < numbers.length; i++) {
        if (numbers[i] % 2 == 0) {
          searchNumber = numbers[i];
        }
      }
    }
    return searchNumber;
  }
}
