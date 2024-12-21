import 'package:flutter/material.dart';

class V0 extends StatefulWidget {
  @override
  State<V0> createState() => _V0State();
}

class _V0State extends State<V0> {
  double _width = 150.0;
  double _height = 150.0;
  double _topRightRadius = 0.0;

  _onChangeWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  _onChangeHeight(double value) {
    setState(() {
      _height = value;
    });
  }

  _onChangeTopRightRadius(double value) {
    setState(() {
      _topRightRadius = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Width: "),
            Text("${_width.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(value: _width, min: 50, max: 300, onChanged: _onChangeWidth),

        Row(
          children: [
            const Text("Height: "),
            Text("${_height.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(value: _height, min: 50, max: 300, onChanged: _onChangeHeight),

        Row(
          children: [
            const Text("Top Right Radius: "),
            Text("${_topRightRadius.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(value: _topRightRadius, min: 0, max: 150, onChanged: _onChangeTopRightRadius),

        Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(_topRightRadius),
            ),
          ),
        )
      ],
    );
  }
}
