import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../rgb_config.dart';

class RGBSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<RGBConfig>(context);

    return Column(
      children: [
        Text('Red: ${config.red}'),
        Slider(
          value: config.red.toDouble(),
          min: 0,
          max: 255,
          activeColor: Colors.red,
          onChanged: (value) => config.setRed(value.toInt()),
        ),
        Text('Green: ${config.green}'),
        Slider(
          value: config.green.toDouble(),
          min: 0,
          max: 255,
          activeColor: Colors.green,
          onChanged: (value) => config.setGreen(value.toInt()),
        ),
        Text('Blue: ${config.blue}'),
        Slider(
          value: config.blue.toDouble(),
          min: 0,
          max: 255,
          activeColor: Colors.blue,
          onChanged: (value) => config.setBlue(value.toInt()),
        ),
      ],
    );
  }
}
