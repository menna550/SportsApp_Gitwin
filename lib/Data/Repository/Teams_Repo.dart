import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Teams_Model.dart';

class GetTeamsRepo {
  Future<TeamsData?> getTeams(String legaID) async {
    // String apiKey =
    //     "61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2";
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Teams&leagueId=${legaID}&APIkey=38a0ae72c4ccaaf68452abb45e271656bc3c7bce6f74cff950088b405d15b041"),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        TeamsData myResponse = TeamsData.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
