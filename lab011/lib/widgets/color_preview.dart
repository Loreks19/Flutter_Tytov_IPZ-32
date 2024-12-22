import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../rgb_config.dart';

class ColorPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<RGBConfig>(context);

    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: config.currentColor,
      ),
    );
  }
}
