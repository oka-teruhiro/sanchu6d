import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShakeAndInvertCounter(),
    );
  }
}

class ShakeAndInvertCounter extends StatefulWidget {
  const ShakeAndInvertCounter({super.key});

  @override
  _ShakeAndInvertCounterState createState() => _ShakeAndInvertCounterState();
}

class _ShakeAndInvertCounterState extends State<ShakeAndInvertCounter> {
  int _counter = 0;
  bool _isShaking = false;
  bool _isInverted = false;
  late DateTime _shakeStartTime;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    userAccelerometerEventStream().listen((UserAccelerometerEvent event) {
      if (event.x.abs() > 1 || event.y.abs() > 1 || event.z.abs() > 1) {
        if (!_isShaking) {
          _shakeStartTime = DateTime.now();
          _isShaking = true;
        } else if (DateTime.now().difference(_shakeStartTime).inSeconds >= 3) {
          _isShaking = false;
          _isInverted = true;
        }
      }
    });

    accelerometerEventStream().listen((AccelerometerEvent event) {
      if (_isInverted && event.z < -9.8) {
        setState(() {
          _counter++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shake and Invert Counter'),
      ),
      body: Center(
        child: Text(
          'Counter: $_counter',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}