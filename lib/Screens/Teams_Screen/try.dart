// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:sports_app/Shared/Colors.dart';

// // import '../../Data/Cubits/Players_cubit/players_cubit.dart';
// // import '../../Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// // import '../../Data/Cubits/cubit/teams_cubit.dart';
// // import '../../Shared/Drawer_List.dart';
// // import '../../Shared/Drawer_header.dart';

// // // import '../Shared/Drawer_List.dart';
// // // import '../Shared/Drawer_header.dart';

// // // import '../Data/Cubits/Countries_cubit/countries_cubit.dart';

// // class Try_screen extends StatelessWidget {
// //   Try_screen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       // left: true,
// //       // right: true,
// //       top: true,
// //       child: Scaffold(
// //           appBar: AppBar(
// //             iconTheme: IconThemeData(color: AppColors.textcolor),
// //             backgroundColor: AppColors.primaryColor,
// //             elevation: 0,
// //           ),
// //           drawer: Drawer(
// //               backgroundColor: AppColors.textcolor,
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     MyDrawerHeader(),
// //                     MyDrawerList(v: Draweritem.home),
// //                   ],
// //                 ),
// //               )),
// //           backgroundColor: AppColors.primaryColor,
// //           body: Column(
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   context.read<TeamsCubit>().getTeams(context);
// //                 },
// //                 child: Container(
// //                   width: 100,
// //                   height: 100,
// //                   color: AppColors.secondaryColor,
// //                   child: BlocBuilder<TeamsCubit, TeamsState>(
// //                       builder: (context, state) {
// //                     if (state is TeamsSuccess) {
// //                       return Expanded(
// //                         child: GridView.count(
// //                           crossAxisCount: 1,
// //                           // Set the childAspectRatio to control the size of the container
// //                           childAspectRatio: 4.5,
// //                           // Set the crossAxisSpacing and mainAxisSpacing to control the spacing between the containers
// //                           crossAxisSpacing: 20,
// //                           mainAxisSpacing: 10,
// //                           children: [
// //                             for (int i = 0;
// //                                 i < state.response.result.length;
// //                                 i++)
// //                               Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child:
// //                                     // BlocBuilder<PlayersCubit, PlayersState>(
// //                                     //     builder: (context, playerstate) {
// //                                     //   if (playerstate is PlayersLoading) {
// //                                     //     return CircularProgressIndicator();
// //                                     //   } else if (playerstate is PlayersSuccess ||
// //                                     //       playerstate is PlayersInitial) {
// //                                     //     return
// //                                     InkWell(
// //                                   onTap: () {
// //                                     context.read<PlayersCubit>().getPlayers(
// //                                         context,
// //                                         teamID: state.response.result[i].teamKey
// //                                             .toString());
// //                                   },
// //                                   child: Container(
// //                                     decoration: BoxDecoration(
// //                                       borderRadius: BorderRadius.circular(50),
// //                                       color: AppColors.secondaryColor,
// //                                     ),
// //                                     child: Padding(
// //                                       padding: const EdgeInsets.all(15.0),
// //                                       child: Row(
// //                                         // mainAxisAlignment: MainAxisAlignment.center,
// //                                         children: [
// //                                           Image.network(
// //                                               state.response.result[i].teamLogo,
// //                                               width: 50,
// //                                               height: 50),
// //                                           const SizedBox(
// //                                             width: 10,
// //                                           ),
// //                                           Text(
// //                                             state.response.result[i].teamName,
// //                                             style: const TextStyle(
// //                                                 color: Colors.white,
// //                                                 fontSize: 20),
// //                                           )
// //                                         ],
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 //   } else {
// //                                 //     return Text('error');
// //                                 //   }
// //                                 // }),
// //                               ),
// //                           ],
// //                         ),
// //                       );
// //                     } else {
// //                       return Text('Error');
// //                     }
// //                   }),
// //                 ),
// //               ),
// //               InkWell(
// //                 onTap: () {
// //                   context.read<TopScorersCubit>().getTopScorers(context);
// //                 },
// //                 child: Container(
// //                   width: 100,
// //                   height: 100,
// //                   color: AppColors.secondaryColor,
// //                   child: BlocBuilder<TopScorersCubit, TopScorersState>(
// //                       builder: (context, state) {
// //                     if (state is TopScorersSuccess) {
// //                       return ListView.builder(
// //                         // separatorBuilder: (context, index) {
// //                         //   return Divider(
// //                         //     color: AppColors.secondaryColor,
// //                         //     height: 2,
// //                         //     thickness: 2,
// //                         //   );
// //                         // },
// //                         itemCount: state.response.result.length,
// //                         itemBuilder: ((context, index) {
// //                           return Padding(
// //                               padding: const EdgeInsets.only(bottom: 8.0),
// //                               child: Container(
// //                                 //padding: const EdgeInsets.only(bottom: 10.0),
// //                                 height: 70,
// //                                 width: MediaQuery.of(context).size.width / 2,
// //                                 decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(25),
// //                                     color: AppColors.secondaryColor),
// //                                 child: ListTile(
// //                                   title: Text(
// //                                     state.response.result[index].playerName,
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                   subtitle: Text(
// //                                     'Scores : ${state.response.result[index].goals}',
// //                                     style: TextStyle(color: Colors.white),
// //                                   ),
// //                                 ),
// //                               ));
// //                         }),
// //                       );
// //                     } else {
// //                       return Text('Error');
// //                     }
// //                   }),
// //                 ),
// //               )
// //             ],
// //           )),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_app/Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// import 'package:sports_app/Data/Cubits/cubit/teams_cubit.dart';
// import 'package:sports_app/Shared/Colors.dart';

// import '../../Data/Cubits/Players_cubit/players_cubit.dart';

// class TeamsScreenTest extends StatefulWidget {
//   const TeamsScreenTest({super.key});

//   @override
//   State<TeamsScreenTest> createState() => _TeamsScreenTestState();
// }

// class _TeamsScreenTestState extends State<TeamsScreenTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: AppColors.textcolor),
//         backgroundColor: AppColors.primaryColor,
//         elevation: 0,
//         // title:
//         // TextField(
//         //   style: TextStyle(color: AppColors.textcolor),
//         //   decoration: InputDecoration(
//         //       hintText: 'Search about player..',
//         //       hintStyle: TextStyle(color: AppColors.textcolor),
//         //       // fillColor: Colors.white,
//         //       // filled: true,
//         //       constraints: BoxConstraints(
//         //         maxWidth: MediaQuery.of(context).size.width * 0.80,
//         //         maxHeight: MediaQuery.of(context).size.width * 0.095,
//         //       ),
//         //       contentPadding: const EdgeInsets.all(12),
//         //       suffixIcon: IconButton(
//         //           onPressed: () {},
//         //           icon: Icon(
//         //             Icons.search,
//         //             color: AppColors.textcolor,
//         //             size: 20,
//         //           )),
//         //       enabledBorder: OutlineInputBorder(
//         //         borderSide: BorderSide(
//         //           color: AppColors.secondaryColor,
//         //         ),
//         //         borderRadius: const BorderRadius.all(
//         //           Radius.circular(50),
//         //         ),
//         //       )),
//         // ),

//         actions: [
//           IconButton(
//               onPressed: () {
//                 //showSearch(context: context, delegate: Scarch());
//               },
//               icon: Icon(Icons.search)),
//         ],
//       ),
//       body: BlocBuilder<TeamsCubit, TeamsState>(
//         builder: (context, state) {
//           if (state is TeamsInitial) {
//             // Fetch the teams when the tab is first opened
//             // context.read<TeamsCubit>().getTeams(context ,legaID: state.);
//             return Center(child: CircularProgressIndicator());
//           } else if (state is TeamsLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is TeamsSuccess) {
//             return Column(children: [
//               ElevatedButton(
//                   onPressed: () {
//                     context.read<TeamsCubit>().getTeams(
//                           context, /*legaID: 'cccc'*/
//                         );
//                   },
//                   child: Text('Teams')),
//               GridView.count(
//                 crossAxisCount: 1,
//                 // Set the childAspectRatio to control the size of the container
//                 childAspectRatio: 4.5,
//                 // Set the crossAxisSpacing and mainAxisSpacing to control the spacing between the containers
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10,
//                 children: [
//                   for (int i = 0; i < state.response.result.length; i++)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         onTap: () {
//                           context.read<PlayersCubit>().getPlayers(context,
//                               teamID:
//                                   state.response.result[i].teamKey.toString());
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: AppColors.secondaryColor,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Row(
//                               // mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.network(state.response.result[i].teamLogo,
//                                     width: 50, height: 50),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   state.response.result[i].teamName,
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 20),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       //   } else {
//                       //     return Text('error');
//                       //   }
//                       // }),
//                     ),
//                 ],
//               )
//             ]);
//           } else {
//             return Text('Error');
//           }
//         },
//       ),
//     );
//   }
// }
