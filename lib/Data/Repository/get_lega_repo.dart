import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/Lega_Model.dart';

class GetLegaRepo {
  Future<GetLegaModel?> getLega(String countryID) async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?met=Leagues&countryId=${countryID}&APIkey=38a0ae72c4ccaaf68452abb45e271656bc3c7bce6f74cff950088b405d15b041"),
      );

      var decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        GetLegaModel myResponse = GetLegaModel.fromJson(decodedResponse);

        return myResponse;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
