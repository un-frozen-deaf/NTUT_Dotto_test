import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: JpegMapScreen(),
    );
  }
}

class JpegMapScreen extends StatefulWidget {
  const JpegMapScreen({super.key});

  @override
  State<JpegMapScreen> createState() => _JpegMapScreenState();
}

class _JpegMapScreenState extends State<JpegMapScreen> {
  final Map<String, Color> roomColors = {
    'room203': Colors.grey,
    'room204': Colors.grey,
  };

  Offset? tapPosition;

  void _onRoomTapped(String roomId) {
    setState(() {
      roomColors[roomId] =
      roomColors[roomId] == Colors.grey ? Colors.red : Colors.grey;
    });
  }

  void _onImageTapped(TapDownDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    setState(() {
      tapPosition = localPosition;
    });
    debugPrint("Tapped at: ${localPosition.dx}, ${localPosition.dy}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JPEGマップ')),
      body: Center(
        child: GestureDetector(
          onTapDown: _onImageTapped,
          child: Stack(
            children: [
              Image.asset(
                'assets/map-2F.jpeg',
                width: 400,
                height: 600,
                fit: BoxFit.contain,
              ),

              // 座標表示
              if (tapPosition != null)
                Positioned(
                  left: tapPosition!.dx,
                  top: tapPosition!.dy,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'x: ${tapPosition!.dx.toStringAsFixed(0)}, y: ${tapPosition!.dy.toStringAsFixed(0)}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),

              // 部屋1
              Positioned(
                left: 100,
                top: 150,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room203'),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: roomColors['room203']!.withOpacity(0.6),
                    child: const Center(child: Text('203')),
                  ),
                ),
              ),

              // 部屋2
              Positioned(
                left: 200,
                top: 300,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room204'),
                  child: Container(
                    width: 60,
                    height: 60,
                    color: roomColors['room204']!.withOpacity(0.6),
                    child: const Center(child: Text('204')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
