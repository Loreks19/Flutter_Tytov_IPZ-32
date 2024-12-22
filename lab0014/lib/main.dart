import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example/native_code'); // MethodChannel
  String _message = "Fetching message..."; // Результат MethodChannel
  String _imagePath = ""; // Шлях до фото

  // Отримання тексту через MethodChannel
  Future<void> _getNativeMessage() async {
    try {
      final String message = await platform.invokeMethod('getNativeData');
      setState(() {
        _message = message; // Установка повідомлення
      });
    } on PlatformException catch (e) {
      setState(() {
        _message = "Failed to get message: '${e.message}'."; // Обробка помилки
      });
    }
  }

  // Робимо фото за допомогою image_picker
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _imagePath = photo.path; // Шлях до зробленого фото
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Camera & Message App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Message: $_message'), // Відображення повідомлення
            ElevatedButton(
              onPressed: _getNativeMessage,
              child: const Text('Get Message'), // Кнопка для отримання тексту
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Take a Photo'), // Кнопка для створення фото
            ),
            if (_imagePath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.file(File(_imagePath)), // Показуємо зроблене фото
              ),
          ],
        ),
      ),
    );
  }
}
