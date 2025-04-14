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
    '工房': Colors.grey,
    'room201': Colors.grey,
    'room202': Colors.grey,
    'room203': Colors.grey,
    'room204': Colors.grey,
    'room205': Colors.grey,
    'room206': Colors.grey,
    'room207': Colors.grey,
    'room208': Colors.grey,
    'room209': Colors.grey,
    'room210': Colors.grey,
    'room211': Colors.grey,
    'room212': Colors.grey,
    'room213': Colors.grey,
    'room214': Colors.grey,
    'room215': Colors.grey,
    'room216': Colors.grey,
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
                width: 900,
                height: 1350,
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

              Positioned(
                left: 85,
                top: 163,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('工房'),
                  child: Container(
                    width: 270,
                    height: 87,
                    color: roomColors['工房']!.withOpacity(0.6),
                    child: const Center(child: Text('工房')),
                  ),
                ),
              ),

              Positioned(
                left: 87,
                top: 562,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room201'),
                  child: Container(
                    width: 87,
                    height: 87,
                    color: roomColors['room201']!.withOpacity(0.6),
                    child: const Center(child: Text('201')),
                  ),
                ),
              ),

              Positioned(
                left: 87,
                top: 430,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room202'),
                  child: Container(
                    width: 87,
                    height: 130,
                    color: roomColors['room202']!.withOpacity(0.6),
                    child: const Center(child: Text('202')),
                  ),
                ),
              ),

              Positioned(
                left: 205,
                top: 430,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room203'),
                  child: Container(
                    width: 55,
                    height: 55,
                    color: roomColors['room203']!.withOpacity(0.6),
                    child: const Center(child: Text('203')),
                  ),
                ),
              ),

              Positioned(
                left: 262,
                top: 430,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room204'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room204']!.withOpacity(0.6),
                    child: const Center(child: Text('204')),
                  ),
                ),
              ),

              Positioned(
                left: 304,
                top: 430,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room205'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room205']!.withOpacity(0.6),
                    child: const Center(child: Text('205')),
                  ),
                ),
              ),

              Positioned(
                left: 346,
                top: 405,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room206'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room206']!.withOpacity(0.6),
                    child: const Center(child: Text('206')),
                  ),
                ),
              ),

              Positioned(
                left: 388,
                top: 380,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room207'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room207']!.withOpacity(0.6),
                    child: const Center(child: Text('207')),
                  ),
                ),
              ),

              Positioned(
                left: 430,
                top: 355,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room208'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room208']!.withOpacity(0.6),
                    child: const Center(child: Text('208')),
                  ),
                ),
              ),

              Positioned(
                left: 472,
                top: 330,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room209'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room209']!.withOpacity(0.6),
                    child: const Center(child: Text('209')),
                  ),
                ),
              ),

              Positioned(
                left: 514,
                top: 305,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room210'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room210']!.withOpacity(0.6),
                    child: const Center(child: Text('210')),
                  ),
                ),
              ),

              Positioned(
                left: 556,
                top: 280,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room211'),
                  child: Container(
                    width: 40,
                    height: 55,
                    color: roomColors['room211']!.withOpacity(0.6),
                    child: const Center(child: Text('211')),
                  ),
                ),
              ),

              Positioned(
                left: 598,
                top: 280,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room212'),
                  child: Container(
                    width: 55,
                    height: 55,
                    color: roomColors['room212']!.withOpacity(0.6),
                    child: const Center(child: Text('212')),
                  ),
                ),
              ),

              Positioned(
                left: 690,
                top: 290,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room213'),
                  child: Container(
                    width: 80,
                    height: 130,
                    color: roomColors['room213']!.withOpacity(0.6),
                    child: const Center(child: Text('213')),
                  ),
                ),
              ),

              Positioned(
                left: 690,
                top: 422,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room214'),
                  child: Container(
                    width: 80,
                    height: 170,
                    color: roomColors['room214']!.withOpacity(0.6),
                    child: const Center(child: Text('214')),
                  ),
                ),
              ),

              Positioned(
                left: 690,
                top: 594,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room215'),
                  child: Container(
                    width: 98,
                    height: 85,
                    color: roomColors['room215']!.withOpacity(0.6),
                    child: const Center(child: Text('215')),
                  ),
                ),
              ),

              Positioned(
                left: 602,
                top: 392,
                child: GestureDetector(
                  onTap: () => _onRoomTapped('room216'),
                  child: Container(
                    width: 52,
                    height: 115,
                    color: roomColors['room216']!.withOpacity(0.6),
                    child: const Center(child: Text('216')),
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
