import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sports_app/Screens/Home_Screen.dart';
import 'package:sports_app/Shared/Colors.dart';
//import 'package:sports_app/Shared/Drawer_List.dart';
import 'package:sports_app/Shared/Fonts.dart';
import 'package:sports_app/Shared/comp_players.dart';

import '../../Shared/Drawer_List.dart';
import '../../Shared/Drawer_header.dart';
import '../Drawer/Profile_screen.dart';
import '../Drawer/Settings_screen.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  //var currentPage = Draweritem.home;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.textcolor),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          title: TextField(
            style: TextStyle(color: AppColors.textcolor),
            decoration: InputDecoration(
                hintText: 'Search about player..',
                hintStyle: TextStyle(color: AppColors.textcolor),
                // fillColor: Colors.white,
                // filled: true,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80,
                  maxHeight: MediaQuery.of(context).size.width * 0.095,
                ),
                contentPadding: const EdgeInsets.all(12),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColors.textcolor,
                      size: 20,
                    )),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                )),
          ),
        ),
        drawer: Drawer(
            backgroundColor: AppColors.textcolor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyDrawerHeader(),
                  MyDrawerList(v: Draweritem.home),
                ],
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            //   child: TextField(
            //     style: TextStyle(color: AppColors.textcolor),
            //     decoration: InputDecoration(
            //         hintText: 'Search about player..',
            //         hintStyle: TextStyle(color: AppColors.textcolor),
            //         // fillColor: Colors.white,
            //         // filled: true,
            //         constraints: BoxConstraints(
            //           maxWidth: MediaQuery.of(context).size.width * 0.80,
            //           maxHeight: MediaQuery.of(context).size.width * 0.095,
            //         ),
            //         contentPadding: const EdgeInsets.all(12),
            //         suffixIcon: IconButton(
            //             onPressed: () {},
            //             icon: Icon(
            //               Icons.search,
            //               color: AppColors.textcolor,
            //               size: 20,
            //             )),
            //         enabledBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             color: AppColors.secondaryColor,
            //           ),
            //           borderRadius: const BorderRadius.all(
            //             Radius.circular(50),
            //           ),
            //         )),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Players',
                style: TextStyle(
                    fontSize: AppFonts.fontsize18, color: AppColors.textcolor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                //itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(3.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: AppColors.primaryColor,
                                // title: Text(
                                //   'Player Information',
                                //   style: TextStyle(
                                //       color: AppColors.textcolor,
                                //       fontSize: AppFonts.fontsize20,
                                //       fontWeight: AppFonts.fontWeight700),
                                //   textAlign: TextAlign.center,
                                // ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/2.jpg'),
                                        radius: 50,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('Cristiano Ronaldo',
                                          style: TextStyle(
                                              color: AppColors.textcolor,
                                              fontSize: AppFonts.fontsize16,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          info(
                                            img: 'assets/yellowcard.png',
                                            text2: '2',
                                          ),
                                          verticalline(),
                                          info(
                                            img: 'assets/redcard.png',
                                            text2: '5',
                                          ),
                                          verticalline(),
                                          info(
                                            img: 'assets/image 132.png',
                                            text2: '240',
                                          ),
                                          verticalline(),
                                          Column(
                                            children: [
                                              Text(
                                                'Assists',
                                                style: TextStyle(
                                                    color: AppColors.textcolor,
                                                    fontSize:
                                                        AppFonts.fontsize18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '10',
                                                style: TextStyle(
                                                    color: AppColors.textcolor,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      info2(
                                          icon: Icons.person,
                                          title: 'Name',
                                          describtion: 'Cristiano Ronaldo'),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      info2(
                                          icon: Icons.numbers,
                                          title: 'Numbers',
                                          describtion: '7'),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      info2(
                                          icon: Icons.location_city,
                                          title: 'Country',
                                          describtion: 'Europe'),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      info2(
                                          icon: Icons.place,
                                          title: 'Position',
                                          describtion: 'Winge'),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      info2(
                                          icon: Icons.numbers,
                                          title: 'Age',
                                          describtion: '41'),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                            onPressed: () async {
                                              String playerName = 'cristiano ';
                                              String playerNumber = '7';
                                              String shareText =
                                                  'PlayerName: $playerName\n PlayerNumber : $playerNumber';
                                              Share.share(shareText);
                                            },
                                            icon: Icon(
                                              Icons.screen_share,
                                              color: AppColors.textcolor,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          color: AppColors.secondaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/2.jpg'),
                                    radius: 50,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Cristiano Ronaldo',
                                      style: TextStyle(
                                          fontSize: AppFonts.fontsize16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textcolor),
                                    ),
                                    Text('data',
                                        style: TextStyle(
                                            fontSize: AppFonts.fontsize12,
                                            color: AppColors.textcolor)),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget myDrawerList() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 15),
  //     child: Column(
  //       children: [
  //         myDraweritem(
  //           1,
  //           'Home',
  //           Icons.home,
  //           currentPage == Draweritem.home ? true : false,
  //         ),
  //         myDraweritem(
  //           2,
  //           'Profile',
  //           Icons.person,
  //           currentPage == Draweritem.profile ? true : false,
  //         ),
  //         myDraweritem(
  //           3,
  //           'Settings',
  //           Icons.settings,
  //           currentPage == Draweritem.settings ? true : false,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget myDraweritem(int id, String name, IconData icon, bool selected) {
  //   return Material(
  //     color: selected ? Colors.grey[300] : Colors.transparent,
  //     child: Column(
  //       children: [
  //         InkWell(
  //           onTap: () {
  //             Navigator.pop(context);
  //             setState(() {
  //               if (id == 1) {
  //                 currentPage = Draweritem.home;
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute<void>(
  //                     builder: (BuildContext context) => home_screen(),
  //                   ),
  //                 );
  //               } else if (id == 2) {
  //                 currentPage = Draweritem.profile;
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute<void>(
  //                     builder: (BuildContext context) => ProfileScreen(),
  //                   ),
  //                 );
  //               } else if (id == 3) {
  //                 currentPage = Draweritem.settings;
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute<void>(
  //                     builder: (BuildContext context) => SettingsScreen(),
  //                   ),
  //                 );
  //               }
  //             });
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.all(15.0),
  //             child: Row(
  //               children: [
  //                 Icon(
  //                   icon,
  //                   color: AppColors.primaryColor,
  //                 ),
  //                 SizedBox(
  //                   width: 15,
  //                 ),
  //                 Text(
  //                   name,
  //                   style: TextStyle(
  //                       fontSize: AppFonts.fontsize16,
  //                       fontWeight: AppFonts.fontWeight400),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

// enum Draweritem {
//   home,
//   profile,
//   settings,
// }
enum Draweritem {
  home,
  profile,
  settings,
}
