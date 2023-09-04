import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mynth_one_client/app/models/favorite_receiver_model.dart';

class FavoriteReceiverRepository {
  static Future<List<FavoriteReceiver>> getAllFavoriteReceiver(
      {required String accessToken}) async {
    final String response = await rootBundle
        .loadString('assets/mock_data/favorite_receiver_data.json');

    List<dynamic> parsedJsonData = jsonDecode(response)['data'];

    return parsedJsonData.map((e) => FavoriteReceiver.fromJson(e)).toList();
  }
}
