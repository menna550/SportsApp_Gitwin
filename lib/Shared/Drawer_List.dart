// import 'package:flutter/material.dart';
// import 'package:sports_app/Shared/Colors.dart';
// import 'package:sports_app/Shared/Fonts.dart';

// // List DrawerListName = ['Home', 'Profile', 'Settings'];
// // List DrawerListIcon = [Icons.home, Icons.person, Icons.settings];

//     var cur = Draweritem.home;
//     Widget MyDrawerList(){
//     return Padding(
//       padding: const EdgeInsets.only(top: 15),
//       child: Column(
//         children: [
//           myDraweritem(
//             1,
//             'Home',
//             Icons.home,
//             cur == Draweritem.home ? true : false,
//           ),
//           myDraweritem(
//             2,
//             'Profile',
//             Icons.person,
//             cur == Draweritem.profile ? true : false,
//           ),
//           myDraweritem(
//             3,
//             'Settings',
//             Icons.settings,
//             cur == Draweritem.settings ? true : false,
//           ),
//         ],
//       ),
//     );
//     }

//   Widget myDraweritem(int id, String name, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.pop(context);
//               setState(() {
//                 if (id == 1) {
//                   cur = Draweritem.home;
//                 } else if (id == 2) {
//                   cur = Draweritem.profile;
//                 } else if (id == 3) {
//                   cur = Draweritem.settings;
//                 }
//               });
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 children: [
//                   Icon(
//                     icon,
//                     color: AppColors.primaryColor,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     name,
//                     style: TextStyle(
//                         fontSize: AppFonts.fontsize16,
//                         fontWeight: AppFonts.fontWeight400),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

import 'package:flutter/material.dart';

import '../Screens/Drawer/Profile_screen.dart';
import '../Screens/Drawer/Settings_screen.dart';
import '../Screens/Home_Screen.dart';
import 'Colors.dart';
import 'Fonts.dart';

class MyDrawerList extends StatefulWidget {
  var v;
  MyDrawerList({super.key, required this.v});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  //var currentPage = widget.v;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          myDraweritem(
            1,
            'Home',
            Icons.home,
            widget.v == Draweritem.home ? true : false,
          ),
          myDraweritem(
            2,
            'Profile',
            Icons.person,
            widget.v == Draweritem.profile ? true : false,
          ),
          myDraweritem(
            3,
            'Settings',
            Icons.settings,
            widget.v == Draweritem.settings ? true : false,
          ),
        ],
      ),
    );
  }

  Widget myDraweritem(int id, String name, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                if (id == 1) {
                  widget.v = Draweritem.home;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => home_screen(),
                    ),
                  );
                } else if (id == 2) {
                  widget.v = Draweritem.profile;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => ProfileScreen(),
                    ),
                  );
                } else if (id == 3) {
                  widget.v = Draweritem.settings;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SettingsScreen(),
                    ),
                  );
                }
                //else {
                //   widget.v = Draweritem.home;
                //   selected = true;
                // }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: AppFonts.fontsize16,
                        fontWeight: AppFonts.fontWeight400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum Draweritem {
  home,
  profile,
  settings,
}
