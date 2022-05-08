import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/guide.dart';

class GetDataService {

  static int _guideLimit = 3;

  static Future<List<Guide>> getGuides() async {
    List<Guide> guidesList = [];
    print('Full url https://guidebook.com/service/v2/upcomingGuides?limit=$_guideLimit');
    final response =  await http.get(
      Uri.parse('https://guidebook.com/service/v2/upcomingGuides?limit=$_guideLimit'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body.toString())['data'];
      for (Map i in body) {
        guidesList.add(Guide.fromJson(i));
      }
      return guidesList;
    }
    throw Exception('error get guides');
  }

  static Future<List<Guide>> getOneGuide(idUrl) async {
    List<Guide> guidesList = [];
    print('Full url https://guidebook.com/service/v2/upcomingGuides?limit=$idUrl');
    final response =  await http.get(
      Uri.parse('https://guidebook.com/service/v2/upcomingGuides?limit=$_guideLimit'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body.toString())['data'];
      for (Map i in body) {
        guidesList.add(Guide.fromJson(i));
      }
      return guidesList;
    }
    throw Exception('error get guides');
  }


}