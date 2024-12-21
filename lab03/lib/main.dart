class Calc {
  bool verbose = false;
  double? _result;
  late double rangeFrom;
  late double rangeTo;
  late double step;

  /// Конструктор з вказаним кроком та діапазоном за замовчуванням [-3, 3]
  Calc({this.step = 0.5}) {
    rangeFrom = -3.0;
    rangeTo = 3.0;
  }

  /// getter для отримання результату
  double? get result => _result;

  /// Метод для ввімкнення/вимкнення виводу у консоль
  void setVerbose(bool value) {
    verbose = value;
  }

  /// Метод для зміни нижньої межі діапазону
  void setRangeFrom(double newRangeFrom) {
    rangeFrom = newRangeFrom;
  }

  /// Метод для зміни верхньої межі діапазону
  void setRangeTo(double newRangeTo) {
    rangeTo = newRangeTo;
  }

  /// Запуск обчислень
  void runCalc() {
    var count = 0;
    var sum = 0.0;
    var x = rangeFrom;

    // Цикл по всьому діапазону
    for (x; x <= rangeTo; x += step) {
      final y = _calc(x);

      if (verbose) {
        print("x = ${x.toStringAsFixed(1)}, y = ${y.toStringAsFixed(2)}");
      }

      sum += y;
      count++;
    }

    _result = sum / count; // Середнє значення функції
  }

  /// Обчислення функції
  double _calc(double x) {
    return 2 * x * x; // Функція y = 2x^2
  }
}

void main() {
  final processor = Calc(step: 0.5); // Створення об'єкта з кроком 0.1

  processor.setVerbose(true);
  processor.setRangeFrom(-3.0); // Демонстративне число для прикладу
  processor.setRangeTo(3.0);   // Демонстративне число для прикладу
  processor.runCalc();
  print("Середнє арифметичне значення функції: ${processor.result}");
}