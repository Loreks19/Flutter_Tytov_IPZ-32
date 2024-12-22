import 'package:flutter/material.dart';
class Calc {
  bool verbose = false;
  double? _result;
  late double rangeFrom;
  late double rangeTo;
  late double step;
  int _iterationCount = 0; // Додано для зберігання кількості ітерацій

  /// Конструктор з вказаним кроком та діапазоном за замовчуванням [-3, 3]
  Calc({this.step = 0.5}) {
    rangeFrom = -3.0;
    rangeTo = 3.0;
  }

  /// getter для отримання результату
  double? get result => _result;

  /// getter для отримання кількості ітерацій
  int get iterationCount => _iterationCount;

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

    _iterationCount = count; // Оновлення кількості ітерацій
    _result = sum / count; // Середнє значення функції
  }

  /// Обчислення функції
  double _calc(double x) {
    return 2 * x * x; // Функція y = 2x^2
  }
}

void main() {
  runApp(const MyApp());
  final processor = Calc(step: 0.5); // Створення об'єкта з кроком 0.1

  processor.setVerbose(true);
  processor.setRangeFrom(-3.0); // Демонстративне число для прикладу
  processor.setRangeTo(3.0);   // Демонстративне число для прикладу
  processor.runCalc();
  print("Середнє арифметичне значення функції: ${processor.result}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "IPZ-32: Max's Last Flutter App" ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter+=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.electric_car),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
