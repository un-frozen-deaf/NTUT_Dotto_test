// building_data_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart'; // kIsWeb
import 'dart:html' as html; // Web用

import 'map_screen.dart'; // Room / Floor / BuildingData クラスが含まれていると仮定

Future<BuildingData> loadBuildingData() async {
  if (kIsWeb) {
    final cacheBust = DateTime.now().millisecondsSinceEpoch;
    final url = 'assets/room_data.json?v=$cacheBust';
    final response = await html.HttpRequest.getString(url);
    final Map<String, dynamic> jsonMap = json.decode(response);
    return BuildingData.fromJson(jsonMap);
  } else {
    final jsonData = await rootBundle.loadString('assets/room_data.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonData);
    return BuildingData.fromJson(jsonMap);
  }
}
