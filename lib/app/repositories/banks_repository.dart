import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mynth_one_client/app/models/banks_model.dart';

class BanksRepository {
  static Future<List<Banks>> getAllBanks({required String accessToken}) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/banks_data.json');

    List<dynamic> parsedJsonData = jsonDecode(response)['data'];

    return parsedJsonData.map((e) => Banks.fromJson(e)).toList();
  }
}
