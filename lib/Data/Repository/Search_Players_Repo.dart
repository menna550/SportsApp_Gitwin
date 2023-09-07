// // import 'dart:convert';

// // //import 'package:filter_listview_example/model/Searchplayers.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:sports_app/Data/Models/Players_Model.dart';

// // class SearchplayersApi {
// //   // static Future<List<PlayersData>> getSearchplayers(String query) async {
// //   //   final url = Uri.parse(
// //   //       'https://apiv2.allsportsapi.com/football/?&met=Players&APIkey=61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2');
// //   //   final response = await http.get(url);

// //   //   if (response.statusCode == 200) {
// //   //     final List Searchplayers = json.decode(response.body);

// //   //     return Searchplayers.((json) => Book.fromJson(json)).where((Searchplayers) {
// //   //       final nameLower = Searchplayers.title.toLowerCase();
// //   //       final typeLower = Searchplayers.author.toLowerCase();
// //   //       final searchLower = query.toLowerCase();

// //   //       return titleLower.contains(searchLower) ||
// //   //           authorLower.contains(searchLower);
// //   //     }).toList();
// //   //   } else {
// //   //     throw Exception();
// //   //   }
// //   // }

// //   Future<void> searchPlayers(String searchQuery) async {
// //     String url =
// //         'https://apiv2.allsportsapi.com/football/?&met=Players&playerName=$searchQuery&APIkey=61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2';

// //     try {
// //       final response = await http.get(Uri.parse(url));
// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         List<dynamic> players = data['result'];

// //         // Update the state with the filtered player data
// //         emit(players);
// //       } else {
// //         print('Request failed with status: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('Error: $e');
// //     }
// //   }
// // }

// import 'dart:convert';

// import 'package:http/http.dart' as http;

// import '../Models/Players_Model.dart';

// import '../Models/Players_Model.dart';

// class GetPlayersRepo {
//   Future<PlayersData?> getPlayers(String teamID) async {
//     try {
//       var response = await http.get(
//         Uri.parse(
//             "https://apiv2.allsportsapi.com/football/?&met=Players&teamId=${teamID}&APIkey=61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2"),
//       );

//       var decodedResponse = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         PlayersData myResponse. = PlayersData.fromJson(decodedResponse);

//         return myResponse;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       return null;s
//     }
//   }
// }

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports_app/Data/Models/Players_Model.dart';
// import 'package:search_list_api_working/user_model.dart';

class FetchUserList {
  var data = [];
  List<PlayersData> results = [];
  // String urlList =
  //     "https://apiv2.allsportsapi.com/football/?&met=Players&&APIkey=61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2";

  Future<List<PlayersData>> getuserList({String? query}) async {
    //var url = Uri.parse(urlList);
    //var response = await http.get(url);
    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Players&teamId=${teamID}&APIkey=61137bf4d63c0690e661ea062464a5395e88b5b45347ba0957f70fef270013b2")),
     
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => PlayersData.fromJson(e)).toList();
        // if (query!= null){
        //   results = results.where((element) => element.result.!.toLowerCase().contains((query.toLowerCase()))).toList();
        // }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
