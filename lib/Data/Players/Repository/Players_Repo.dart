import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:sports_app/Data/Models/Countries_Model.dart';

import '../Models/Players_Model.dart';

var teamId = 96;

class GetPlayersRepo {
  Future<PlayersData?> getPlayers() async {
    String apiKey =
        '61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2';
    try {
      var response = await http.get(
        Uri.parse(
            'https://apiv2.allsportsapi.com/football/?&met=Players&teamId=$teamId&APIkey=$apiKey'),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        PlayersData myResponse = PlayersData.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
