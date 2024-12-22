import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'rgb_config.dart';
import 'widgets/rgb_sliders.dart';
import 'widgets/color_preview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RGBConfig(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RGB Color Picker'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RGBSliders(),
            const SizedBox(height: 16),
            ColorPreview(),
          ],
        ),
      ),
    );
  }
}
