
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab15/main.dart' as calc_lib;
import 'package:lab15/main.dart';

void main() {
  group('Calc class tests', () {
    // Значення має бути позитивним
    test('Function calculation works correctly', () {
      final calc = calc_lib.Calc(step: 0.5); // Ініціалізація Calc
      calc.setRangeFrom(-3.0);
      calc.setRangeTo(3.0);
      calc.runCalc();

      expect(calc.result, isNotNull);
      expect(calc.result, greaterThan(0)); // Значення має бути позитивним
    });
    // Перевірка кількості ітерацій
    test('Correct number of iterations', () {
      final calc = calc_lib.Calc(step: 0.5);

      // Налаштування діапазону
      calc.setRangeFrom(-1.0);
      calc.setRangeTo(1.0);

      // Запуск обчислень
      calc.runCalc();

      expect(calc.iterationCount, 5, reason: 'Number of iterations is incorrect');
    });

  });

  group('Widget tests', () {
    testWidgets('App displays correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text("IPZ-32: Max's Last Flutter App"), findsOneWidget);
    });

    testWidgets('FloatingActionButton with Electric Car icon is present',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());

          // Перевірка наявності FloatingActionButton
          final fab = find.byType(FloatingActionButton);
          expect(fab, findsOneWidget);

          // Перевірка іконки
          final icon = find.widgetWithIcon(FloatingActionButton, Icons.electric_car);
          expect(icon, findsOneWidget);
        });

    testWidgets('Counter increments by 1', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Початкове значення
      expect(find.text('0'), findsOneWidget);

      // Натискаємо кнопку
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();

      // Значення після натискання
      expect(find.text('1'), findsOneWidget);
    });
  });
}
