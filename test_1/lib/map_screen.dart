import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _currentFloor = '1F';
  String _currentRoomDescription = '';
  Offset? tapPosition;

  final Map<String, Color> roomColors = {
    //4F_room
    'room401': Colors.grey, 'room402': Colors.grey, 'room403': Colors.grey,
    'room404': Colors.grey, 'room405': Colors.grey, 'room406': Colors.grey,
    'room407': Colors.grey, 'room408': Colors.grey, 'room409': Colors.grey,
    'room410': Colors.grey, 'room411': Colors.grey, 'room412': Colors.grey,
    'room413': Colors.grey, 'room414': Colors.grey, 'room415': Colors.grey,
    //2F_room
    '工房': Colors.grey,
    'room201': Colors.grey, 'room202': Colors.grey, 'room203': Colors.grey,
    'room204': Colors.grey, 'room205': Colors.grey, 'room206': Colors.grey,
    'room207': Colors.grey, 'room208': Colors.grey, 'room209': Colors.grey,
    'room210': Colors.grey, 'room211': Colors.grey, 'room212': Colors.grey,
    'room213': Colors.grey, 'room214': Colors.grey, 'room215': Colors.grey,
    'room216': Colors.grey,
    //1F_room
    'room101': Colors.grey, 'room102': Colors.grey, 'room103': Colors.grey,
    'room104': Colors.grey, 'room105': Colors.grey, 'room106': Colors.grey,
    'room107': Colors.grey, 'room108': Colors.grey, 'room109': Colors.grey,
    'room110': Colors.grey, 'room111': Colors.grey, 'room112': Colors.grey,
    'room113': Colors.grey, 'room114': Colors.grey, 'room115': Colors.grey,
    'room116': Colors.grey, 'room117': Colors.grey, 'room118': Colors.grey,
    'room119': Colors.grey, 'room120': Colors.grey, 'room121': Colors.grey,
    'room122': Colors.grey,
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
    // 4F Room descriptions
      case 'room401':
        return '401教室: コンピューターラボ';
      case 'room402':
        return '402教室: 演習室';
      case 'room403':
        return '403教室: 研究室 - 佐藤 健一 教授';
      case 'room404':
        return '404教室: 研究室 - 山田 太郎 教授';
      case 'room405':
        return '405教室: セミナールーム';
      case 'room406':
        return '406教室: 情報科学実験室';
      case 'room407':
        return '407教室: メディアラボ';
      case 'room408':
        return '408教室: 学生プロジェクト室';
      case 'room409':
        return '409教室: 大会議室';
      case 'room410':
        return '410教室: 小会議室';
      case 'room411':
        return '411教室: 創発スペース';
      case 'room412':
        return '412教室: IoTラボ';
      case 'room413':
        return '413教室: AIラーニングセンター';
      case 'room414':
        return '414教室: デザインスタジオ';
      case 'room415':
        return '415教室: リフレッシュスペース';

    // 2F Room descriptions
      case '工房':
        return '工房: ものづくりの空間です。';
      case 'room201':
        return 'room201: 会議室です。';
      case 'room202':
        return 'room202: 学習室です。';
      case 'room203':
        return 'room203: 休憩室です。';
      case 'room204':
        return '204教室: 小林 洋子 教授';
      case 'room205':
        return '205教室: 新井 達也 教授';
      case 'room206':
        return '206教室: 新田 伸也 教授';
      case 'room207':
        return '207教室: 田中 晃 教授';
      case 'room208':
        return '208教室: 中島 幸則 教授';
      case 'room209':
        return '209教室: 神村 幸蔵 教授';
      case 'room210':
        return '210教室: 脇中 起余子 教授';
      case 'room211':
        return '211教室: 大杉 豊 教授';
      case 'room212':
        return '212教室: グリーンランド';
      case 'room213':
        return '213教室: 美術室です。';
      case 'room214':
        return '214教室: 講義室です。';
      case 'room215':
        return '215教室: 休憩室です。';
      case 'room216':
        return '216教室: セミナー室です。';

    // 1F Room descriptions
      case 'room101':
        return 'room101: 説明文がありません';
      case 'room102':
        return 'room102: 説明文がありません';
      case 'room103':
        return 'room103: 説明文がありません';
      case 'room104':
        return 'room104: 説明文がありません';
      case 'room105':
        return 'room105: 説明文がありません';
      case 'room106':
        return 'room106: 説明文がありません';
      case 'room107':
        return 'room107: 説明文がありません';
      case 'room108':
        return 'room108: 説明文がありません';
      case 'room109':
        return 'room109: 説明文がありません';
      case 'room110':
        return 'room110: 説明文がありません';
      case 'room111':
        return 'room111: 説明文がありません';
      case 'room112':
        return 'room112: 説明文がありません';
      case 'room113':
        return 'room113: 説明文がありません';
      case 'room114':
        return 'room114: 説明文がありません';
      case 'room115':
        return 'room115: 説明文がありません';
      case 'room116':
        return 'room116: 説明文がありません';
      case 'room117':
        return 'room117: 説明文がありません';
      case 'room118':
        return 'room118: 説明文がありません';
      case 'room119':
        return 'room119: 説明文がありません';
      case 'room120':
        return 'room120: 説明文がありません';
      case 'room121':
        return 'room121: 説明文がありません';
      case 'room122':
        return 'room122: 説明文がありません';
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
    final screenSize = MediaQuery.of(context).size;
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
              DropdownMenuItem(value: '3F', child: Text('3F')),
              DropdownMenuItem(value: '4F', child: Text('4F')),
              DropdownMenuItem(value: '5F', child: Text('5F')),
              DropdownMenuItem(value: '6F', child: Text('6F')),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onTapDown: _onImageTapped,
        child: InteractiveViewer(
          panEnabled: true,
          scaleEnabled: true,
          minScale: 0.5,
          maxScale: 4.0,
          constrained: false,
          child: Stack(
            children: [
              // 画像
              Image.asset(
                _getMapAssetPath(),
                width: screenSize.width,
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
              if (_currentFloor == '4F') ...[
                // 4F Rooms
                _buildScaledRoom('room401', 61, 434, 85, 76, '401', screenSize.width / 792),
                _buildScaledRoom('room402', 61, 512, 85, 77, '402', screenSize.width / 792),
                _buildScaledRoom('room403', 175, 434, 57, 60, '403', screenSize.width / 792),
                _buildScaledRoom('room404', 234, 425, 39, 69, '404', screenSize.width / 792),
                _buildScaledRoom('room405', 275, 400, 39, 60, '405', screenSize.width / 792),
                _buildScaledRoom('room406', 316, 378, 38, 60, '406', screenSize.width / 792),
                _buildScaledRoom('room407', 356, 359, 38, 60, '407', screenSize.width / 792),
                _buildScaledRoom('room408', 396, 335, 38, 60, '408', screenSize.width / 792),
                _buildScaledRoom('room409', 435, 314, 38, 60, '409', screenSize.width / 792),
                _buildScaledRoom('room410', 558, 275, 40, 53, '410', screenSize.width / 792),
                _buildScaledRoom('room411', 558, 347, 52, 80, '411', screenSize.width / 792),
                _buildScaledRoom('room412', 558, 429, 52, 76, '412', screenSize.width / 792),
                _buildScaledRoom('room413', 640, 352, 83, 75, '413', screenSize.width / 792),
                _buildScaledRoom('room414', 640, 429, 83, 75, '414', screenSize.width / 792),
                _buildScaledRoom('room415', 618, 583, 122, 82, '415', screenSize.width / 792),
              ] else if (_currentFloor == '2F') ...[
                // 2F Rooms
                _buildScaledRoom('工房', 18, 105, 283, 96, '工房',screenSize.width / 792),
                _buildScaledRoom('room201', 17, 533, 94, 99, '201',screenSize.width / 792),
                _buildScaledRoom('room202', 17, 391, 94, 140, '202',screenSize.width / 792),
                _buildScaledRoom('room203', 146, 392, 61, 55, '203',screenSize.width / 792),
                _buildScaledRoom('room204', 209, 392, 43, 55, '204',screenSize.width / 792),
                _buildScaledRoom('room205', 254, 392, 43, 55, '205',screenSize.width / 792),
                _buildScaledRoom('room206', 299, 357, 43, 55, '206',screenSize.width / 792),
                _buildScaledRoom('room207', 344, 332, 43, 55, '207',screenSize.width / 792),
                _buildScaledRoom('room208', 389, 307, 43, 55, '208',screenSize.width / 792),
                _buildScaledRoom('room209', 434, 282, 43, 55, '209',screenSize.width / 792),
                _buildScaledRoom('room210', 479, 257, 43, 55, '210',screenSize.width / 792),
                _buildScaledRoom('room211', 524, 232, 43, 55, '211',screenSize.width / 792),
                _buildScaledRoom('room212', 569, 232, 57, 55, '212',screenSize.width / 792),
                _buildScaledRoom('room213', 665, 238, 80, 153, '213',screenSize.width / 792),
                _buildScaledRoom('room214', 665, 393, 80, 170, '214',screenSize.width / 792),
                _buildScaledRoom('room215', 665, 565, 108, 98, '215',screenSize.width / 792),
                _buildScaledRoom('room216', 569, 350, 57, 123, '216',screenSize.width / 792),
              ] else ...[
                // 1F Rooms
                _buildScaledRoom('room101', 61, 591, 85, 76, '101', screenSize.width / 792),
                _buildScaledRoom('room102', 61, 512, 85, 77, '102', screenSize.width / 792),
                _buildScaledRoom('room103', 61, 434, 85, 76, '103', screenSize.width / 792),
                _buildScaledRoom('room104', 250, 510, 60, 156, '104', screenSize.width / 792),
                _buildScaledRoom('room104', 233, 629, 17, 37, '', screenSize.width / 792),
                _buildScaledRoom('room105', 175, 434, 57, 60, '105', screenSize.width / 792),
                _buildScaledRoom('room106', 234, 425, 39, 69, '106', screenSize.width / 792),
                _buildScaledRoom('room107', 275, 400, 39, 60, '107', screenSize.width / 792),
                _buildScaledRoom('room108', 316, 378, 38, 60, '108', screenSize.width / 792),
                _buildScaledRoom('room109', 356, 359, 38, 60, '109', screenSize.width / 792),
                _buildScaledRoom('room110', 396, 335, 38, 60, '110', screenSize.width / 792),
                _buildScaledRoom('room111', 435, 314, 38, 60, '111', screenSize.width / 792),
                _buildScaledRoom('room112', 558, 275, 40, 53, '112', screenSize.width / 792),
                _buildScaledRoom('room113', 640, 275, 83, 75, '113', screenSize.width / 792),
                _buildScaledRoom('room114', 640, 352, 83, 75, '114', screenSize.width / 792),
                _buildScaledRoom('room115', 640, 429, 83, 75, '115', screenSize.width / 792),
                _buildScaledRoom('room116', 640, 506, 85, 75, '116', screenSize.width / 792),
                _buildScaledRoom('room117', 618, 583, 122, 82, '117', screenSize.width / 792),
                _buildScaledRoom('room118', 486, 583, 130, 82, '118', screenSize.width / 792),
                _buildScaledRoom('room119', 558, 429, 52, 76, '119', screenSize.width / 792),
                _buildScaledRoom('room120', 558, 347, 52, 80, '120', screenSize.width / 792),
                _buildScaledRoom('room121', 60, 191, 258, 80, '121', screenSize.width / 792),
                _buildScaledRoom('room121', 60, 111, 82, 80, '121', screenSize.width / 792),
                _buildScaledRoom('room122', 144, 126, 82, 63, '122', screenSize.width / 792),
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

  String _getMapAssetPath() {
    switch (_currentFloor) {
      case '2F':
        return 'assets/map-2F.png';
      case '3F':
        return 'assets/map-3F.png';
      case '4F':
        return 'assets/map-4F.png';
      default:
        return 'assets/map-1F.png';
    }
  }

  Widget _buildScaledRoom(String id, double left, double top, double width,
      double height, String label, double scale) {
    return Positioned(
      left: left * scale,
      top: top * scale,
      child: GestureDetector(
        onTap: () => _onRoomTapped(id),
        child: Container(
          width: width * scale,
          height: height * scale,
          color: roomColors[id]?.withOpacity(0.6) ?? Colors.grey.withOpacity(0.6),
          child: Center(child: Text(label, style: TextStyle(fontSize: 12 * scale))),
        ),
      ),
    );
  }
}