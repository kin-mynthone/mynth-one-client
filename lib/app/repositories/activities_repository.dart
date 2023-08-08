import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mynth_one_client/app/models/activity_model.dart';

class ActivitiesRepository {
  static Future<List<Data>> getPartialActivities(
      {required String accessToken}) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/activity_data.json');

    List<dynamic> parsedJsonData = jsonDecode(response)['data'];

    return parsedJsonData
        .map((e) => Data.fromJson(e))
        .where((element) => element.status == 'OnGoing')
        .toList();
  }

  static Future<List<Data>> getAllActivities(
      {required String accessToken}) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/activity_data.json');

    List<dynamic> parsedJsonData = jsonDecode(response)['data'];

    return parsedJsonData.map((e) => Data.fromJson(e)).toList();
  }
}
