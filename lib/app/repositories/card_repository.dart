import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mynth_one_client/app/models/card_model.dart';

class CardRepository {
  static Future<List<Data>> getCards({required String accessToken}) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/cards_data.json');

    List<dynamic> parsedJsonData = jsonDecode(response)['data'];

    return parsedJsonData.map((e) => Data.fromJson(e)).toList();
  }
}
