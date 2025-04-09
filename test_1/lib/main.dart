import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SvgMapScreen(),
    );
  }
}

class SvgMapScreen extends StatefulWidget {
  const SvgMapScreen({super.key});

  @override
  State<SvgMapScreen> createState() => _SvgMapScreenState();
}

class _SvgMapScreenState extends State<SvgMapScreen> {
  final Map<String, Color> roomColors = {
    'room203': Colors.grey,
    'room204': Colors.grey,
  };

  void _onRoomTapped(String roomId) {
    setState(() {
      roomColors[roomId] = roomColors[roomId] == Colors.grey ? Colors.red : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SVGマップ')),
      body: Center(
        child: SvgPicture.asset(
          'assets/usa.svg',
          width: 400,
          height: 600,
          semanticsLabel: 'USA MAP',
          allowDrawingOutsideViewBox: true,
          clipBehavior: Clip.none,
          placeholderBuilder: (context) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
