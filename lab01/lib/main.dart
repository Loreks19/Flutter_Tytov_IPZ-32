void main() {
  const start = -4.0; // Початок діапазону
  const end = 5.0; // Кінець діапазону
  const step = 0.1; // Крок
  var x = start; // Початкове значення
  var minY = double.infinity; // Початкове мінімальне значення
  var maxY = double.negativeInfinity; // Початкове максимальне значення
  var count = 0; // Лічильник кількості значень

  print("y = x^2 + x - 100\n");

  while (x <= end) {
    var y = x * x + x - 100; // Обчислення функції
    print('x = ${x.toStringAsFixed(1)}, y = ${y.toStringAsFixed(2)}');

    if (y < minY) {
      minY = y; // Оновлення мінімального значення
    }
    if (y > maxY) {
      maxY = y; // Оновлення максимального значення
    }

    count++;
    x += step; // Збільшення значення x на крок
  }

  print('\nРезультати:');
  print('Мінімальне значення функції: ${minY.toStringAsFixed(2)}');
  print('Максимальне значення функції: ${maxY.toStringAsFixed(2)}');
}