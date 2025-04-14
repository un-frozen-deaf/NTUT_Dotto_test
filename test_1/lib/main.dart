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
  String _currentFloor = '2F';

  final Map<String, Color> roomColors = {
    // 2F
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
    // 3F（仮）
    'room301': Colors.grey,
    'room302': Colors.grey,
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
      appBar: AppBar(
        title: const Text('校舎棟マップ'),
        actions: [
          DropdownButton<String>(
            value: _currentFloor,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _currentFloor = value;
                  tapPosition = null;
                });
              }
            },
            items: const [
              DropdownMenuItem(value: '2F', child: Text('2F')),
              DropdownMenuItem(value: '3F', child: Text('3F')),
            ],
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: _onImageTapped,
          child: Stack(
            children: [
              Image.asset(
                _currentFloor == '2F'
                    ? 'assets/map-2F.png'
                    : 'assets/map-3F.png',
                width: 792,
                height: 1188,
                fit: BoxFit.contain,
              ),

              if (tapPosition != null)
                Positioned(
                  left: tapPosition!.dx,
                  top: tapPosition!.dy,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'x: ${tapPosition!.dx.toStringAsFixed(0)}, y: ${tapPosition!.dy.toStringAsFixed(0)}',
                      style:
                      const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),

              if (_currentFloor == '2F') ...[
                // === 2Fの部屋配置 ===
                _buildRoom('工房', 43, 227, 270, 87, '工房'),
                _buildRoom('room201', 45, 626, 87, 87, '201'),
                _buildRoom('room202', 45, 494, 87, 130, '202'),
                _buildRoom('room203', 163, 494, 55, 55, '203'),
                _buildRoom('room204', 220, 494, 40, 55, '204'),
                _buildRoom('room205', 262, 494, 40, 55, '205'),
                _buildRoom('room206', 304, 469, 40, 55, '206'),
                _buildRoom('room207', 346, 444, 40, 55, '207'),
                _buildRoom('room208', 388, 419, 40, 55, '208'),
                _buildRoom('room209', 430, 394, 40, 55, '209'),
                _buildRoom('room210', 472, 369, 40, 55, '210'),
                _buildRoom('room211', 514, 344, 40, 55, '211'),
                _buildRoom('room212', 556, 344, 55, 55, '212'),
                _buildRoom('room213', 648, 354, 80, 130, '213'),
                _buildRoom('room214', 648, 486, 80, 170, '214'),
                _buildRoom('room215', 648, 658, 98, 85, '215'),
                _buildRoom('room216', 560, 456, 52, 115, '216'),
              ] else ...[
                // === 3Fの仮部屋配置 ===
                _buildRoom('room301', 100, 200, 100, 100, '301'),
                _buildRoom('room302', 250, 300, 100, 100, '302'),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoom(String id, double left, double top, double width,
      double height, String label) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () => _onRoomTapped(id),
        child: Container(
          width: width,
          height: height,
          color: roomColors[id]?.withOpacity(0.6) ?? Colors.grey.withOpacity(0.6),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}
