// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:share_plus/share_plus.dart';

// import '../../Data/Players/Players_cubit/players_cubit.dart';
// import '../../Shared/Colors.dart';
// import '../../Shared/Fonts.dart';
// import '../../Shared/comp_players.dart';

// class Scarch extends SearchDelegate {
//   List quotes = [];
//   String author = "";
//   String result = "";

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     IconButton(onPressed: () {}, icon: Icon(Icons.close));
//     query = "";
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return BlocBuilder<PlayersCubit, PlayersState>(
//       builder: (context, state) {
//         if (state is PlayersSuccess) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//               //   child: TextField(
//               //     style: TextStyle(color: AppColors.textcolor),
//               //     decoration: InputDecoration(
//               //         hintText: 'Search about player..',
//               //         hintStyle: TextStyle(color: AppColors.textcolor),
//               //         // fillColor: Colors.white,
//               //         // filled: true,
//               //         constraints: BoxConstraints(
//               //           maxWidth: MediaQuery.of(context).size.width * 0.80,
//               //           maxHeight: MediaQuery.of(context).size.width * 0.095,
//               //         ),
//               //         contentPadding: const EdgeInsets.all(12),
//               //         suffixIcon: IconButton(
//               //             onPressed: () {},
//               //             icon: Icon(
//               //               Icons.search,
//               //               color: AppColors.textcolor,
//               //               size: 20,
//               //             )),
//               //         enabledBorder: OutlineInputBorder(
//               //           borderSide: BorderSide(
//               //             color: AppColors.secondaryColor,
//               //           ),
//               //           borderRadius: const BorderRadius.all(
//               //             Radius.circular(50),
//               //           ),
//               //         )),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   'Players',
//                   style: TextStyle(
//                       fontSize: AppFonts.fontsize18,
//                       color: AppColors.textcolor),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: state.response.result?.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.all(3.0),
//                       child: InkWell(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return AlertDialog(
//                                   backgroundColor: AppColors.primaryColor,
//                                   // title: Text(
//                                   //   'Player Information',
//                                   //   style: TextStyle(
//                                   //       color: AppColors.textcolor,
//                                   //       fontSize: AppFonts.fontsize20,
//                                   //       fontWeight: AppFonts.fontWeight700),
//                                   //   textAlign: TextAlign.center,
//                                   // ),
//                                   content: SingleChildScrollView(
//                                     child: Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 20,
//                                         ),
//                                         CircleAvatar(
//                                           backgroundImage: NetworkImage(state
//                                                   .response
//                                                   .result![index]
//                                                   .playerImage ??
//                                               ''),
//                                           radius: 50,
//                                         ),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         Text(
//                                             state.response.result![index]
//                                                     .playerName ??
//                                                 "",
//                                             style: TextStyle(
//                                                 color: AppColors.textcolor,
//                                                 fontSize: AppFonts.fontsize16,
//                                                 fontWeight: FontWeight.w600)),
//                                         const SizedBox(
//                                           height: 30,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             info(
//                                               img: 'assets/yellowcard.png',
//                                               text2: state
//                                                       .response
//                                                       .result![index]
//                                                       .playerYellowCards ??
//                                                   "",
//                                             ),
//                                             verticalline(),
//                                             info(
//                                               img: 'assets/redcard.png',
//                                               text2: state
//                                                       .response
//                                                       .result![index]
//                                                       .playerRedCards ??
//                                                   '',
//                                             ),
//                                             verticalline(),
//                                             info(
//                                               img: 'assets/image 132.png',
//                                               text2: state
//                                                       .response
//                                                       .result![index]
//                                                       .playerGoals ??
//                                                   "",
//                                             ),
//                                             verticalline(),
//                                             Column(
//                                               children: [
//                                                 Text(
//                                                   'Assists',
//                                                   style: TextStyle(
//                                                       color:
//                                                           AppColors.textcolor,
//                                                       fontSize:
//                                                           AppFonts.fontsize18,
//                                                       fontWeight:
//                                                           FontWeight.w500),
//                                                 ),
//                                                 Text(
//                                                   state.response.result![index]
//                                                           .playerAssists ??
//                                                       "",
//                                                   style: TextStyle(
//                                                       color:
//                                                           AppColors.textcolor,
//                                                       fontSize: 14),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         const SizedBox(
//                                           height: 25,
//                                         ),
//                                         info2(
//                                             icon: Icons.person,
//                                             title: 'Name',
//                                             describtion: state
//                                                     .response
//                                                     .result![index]
//                                                     .playerName ??
//                                                 ""),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         info2(
//                                             icon: Icons.numbers,
//                                             title: 'Numbers',
//                                             describtion: state
//                                                     .response
//                                                     .result![index]
//                                                     .playerNumber ??
//                                                 ""),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         info2(
//                                             icon: Icons.location_city,
//                                             title: 'Country',
//                                             describtion: state
//                                                     .response
//                                                     .result![index]
//                                                     .playerCountry ??
//                                                 ""),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         info2(
//                                             icon: Icons.place,
//                                             title: 'Position',
//                                             describtion: state
//                                                     .response
//                                                     .result![index]
//                                                     .playerType ??
//                                                 ""),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         info2(
//                                             icon: Icons.numbers,
//                                             title: 'Age',
//                                             describtion: state.response
//                                                     .result![index].playerAge ??
//                                                 ""),
//                                         Align(
//                                           alignment: Alignment.bottomRight,
//                                           child: IconButton(
//                                               onPressed: () async {
//                                                 String playerName = state
//                                                         .response
//                                                         .result![index]
//                                                         .playerName ??
//                                                     "";
//                                                 String playerNumber = state
//                                                         .response
//                                                         .result![index]
//                                                         .playerNumber ??
//                                                     "";
//                                                 String shareText =
//                                                     'PlayerName: $playerName\n PlayerNumber : $playerNumber';
//                                                 Share.share(shareText);
//                                               },
//                                               icon: Icon(
//                                                 Icons.screen_share,
//                                                 color: AppColors.textcolor,
//                                               )),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               });
//                         },
//                         child: Container(
//                             height: 50,
//                             width: double.infinity,
//                             color: AppColors.secondaryColor,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10, vertical: 5),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.1,
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.1,
//                                     child: CircleAvatar(
//                                       backgroundImage: NetworkImage(state
//                                               .response
//                                               .result![index]
//                                               .playerImage ??
//                                           ""),
//                                       radius: 50,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 12,
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         state.response.result![index]
//                                                 .playerName ??
//                                             "",
//                                         style: TextStyle(
//                                             fontSize: AppFonts.fontsize16,
//                                             fontWeight: FontWeight.w600,
//                                             color: AppColors.textcolor),
//                                       ),
//                                       Text(
//                                           state.response.result![index]
//                                                   .playerType ??
//                                               "",
//                                           style: TextStyle(
//                                               fontSize: AppFonts.fontsize12,
//                                               color: AppColors.textcolor)),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           );
//         } else {
//           return Text('Error');
//         }
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = quotes.where((quotes) {
//       return quotes.toLowerCase().contains(query.toLowerCase());
//     });

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, int index) {
//         return ListTile(
//           title: Text(
//             suggestions.elementAt(index),
//           ),
//           onTap: () {
//             result = suggestions.elementAt(index);
//             close(context, result);
//           },
//         );
//       },
//     );
//   }
// }
