import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 75.0;
const _bgColor = Colors.green;
const _borderColor = Colors.grey;
const _borderWidth = 3.0;
const _borderRadius = 37.5;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildZero(),
      ),
    );
  }

  List<Widget> _buildZero() {
    return [
      _buildLineSide(),
      _buildLineTopBottom(),
      _buildLineSideBottom(),
      _buildLineSideBottom(),
      _buildLineSideBottom(),
    ];
  }

  Widget _buildLineSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLineSideBottom(),
      ],
    );
  }

  Widget _buildLineTopBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(Colors.green),
        _buildDot(Colors.green),
        _buildEmpty(),

      ],
    );
  }

  Widget _buildLineSideBottom(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(Colors.blue),

      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}