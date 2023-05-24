import 'dart:convert';

import 'package:game_profile/models/gameTV.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<GameTv?> getGameTv() async {
    GameTv gamesTvResponse = GameTv();
    var client = http.Client();
    print("called");

    var uri = Uri.parse(
        "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=15&status=all");

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      // var json = response.body;
      var jsonD = jsonDecode(response.body);
      gamesTvResponse = GameTv.fromJson(jsonD);
      print("responded");
      return gamesTvResponse;
    }
    return null;
  }
}
