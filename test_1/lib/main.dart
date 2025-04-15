import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1; // 初期選択はマップ（インデックス1）

  // 表示する画面のリスト
  final List<Widget> _screens = [
    const HomeScreen(),        // ホーム画面
    const JpegMapScreen(),     // マップ画面（既存）
    const SubjectInfoScreen(), // 科目情報画面
    const SettingsScreen(),    // 設定画面
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'マップ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '科目情報',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
    );
  }
}

// ホーム画面（プレースホルダー）
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: const Center(
        child: Text('ホーム画面'),
      ),
    );
  }
}

// 科目情報画面（プレースホルダー）
class SubjectInfoScreen extends StatelessWidget {
  const SubjectInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('科目情報'),
      ),
      body: const Center(
        child: Text('科目情報画面'),
      ),
    );
  }
}

// 設定画面（プレースホルダー）
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: const Center(
        child: Text('設定画面'),
      ),
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
  String _currentRoomDescription = '';
  Offset? tapPosition;

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
    'room101': Colors.grey,
    'room102': Colors.grey,
  };

  void _onRoomTapped(String roomId) {
    setState(() {
      roomColors.updateAll((key, value) => Colors.grey);
      roomColors[roomId] = Colors.red;
      _currentRoomDescription = _getRoomDescription(roomId);
    });
  }

  String _getRoomDescription(String roomId) {
    switch (roomId) {
      case '工房':
        return '工房: ものづくりの空間です。';
      case 'room201':
        return 'room201: 会議室です。';
      case 'room202':
        return 'room202: 学習室です。';
      case 'room203':
        return 'room203: 休憩室です。';
      case 'room204':
        return 'room204: 調理室です。';
      case 'room205':
        return 'room205: パソコン室です。';
      case 'room206':
        return 'room206: ラボです。';
      case 'room207':
        return 'room207: プレゼンテーションルームです。';
      case 'room208':
        return 'room208: 研究室です。';
      case 'room209':
        return 'room209: 映像編集室です。';
      case 'room210':
        return 'room210: 図書室です。';
      case 'room211':
        return 'room211: 音楽室です。';
      case 'room212':
        return 'room212: 体育館です。';
      case 'room213':
        return 'room213: 美術室です。';
      case 'room214':
        return 'room214: 講義室です。';
      case 'room215':
        return 'room215: 休憩室です。';
      case 'room216':
        return 'room216: セミナー室です。';
      default:
        return '説明文がありません';
    }
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
      backgroundColor: Colors.white,
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
                  _currentRoomDescription = '';
                });
              }
            },
            items: const [
              DropdownMenuItem(value: '1F', child: Text('1F')),
              DropdownMenuItem(value: '2F', child: Text('2F')),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onTapDown: _onImageTapped,
        child: InteractiveViewer(
          panEnabled: true,
          scaleEnabled: true,
          minScale: 1.0,
          maxScale: 4.0,
          child: Stack(
            children: [
              // 画像
              Image.asset(
                _currentFloor == '2F'
                    ? 'assets/map-2F-1.png'
                    : 'assets/map-1F.png',
                width: 792,
                height: 1188,
                fit: BoxFit.contain,
              ),

              // タップ位置表示
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

              // 部屋
              if (_currentFloor == '2F') ...[
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
                _buildRoom('room101', 100, 200, 100, 100, '101'),
                _buildRoom('room102', 250, 300, 100, 100, '102'),
              ],

              // 説明文
              if (_currentRoomDescription.isNotEmpty)
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      _currentRoomDescription,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
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