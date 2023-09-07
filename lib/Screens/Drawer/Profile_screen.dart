import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app/Shared/Drawer_List.dart';
import 'package:sports_app/Shared/comp_players.dart';

import '../../Shared/Colors.dart';
import '../../Shared/Drawer_header.dart';
import '../../Shared/Fonts.dart';
import '../Home_Screen.dart';
import 'Settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //var currentPage = Draweritem.profile;
  String? _username;
  String? _email;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    _email = prefs.getString('email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.textcolor),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(color: AppColors.textcolor),
        ),
      ),
      drawer: Drawer(
          backgroundColor: AppColors.textcolor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyDrawerHeader(),
                MyDrawerList(v: Draweritem.profile),
                //myDrawerList(),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 50,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                  Positioned(
                    left: 55,
                    top: 80,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orange,
                          border: Border.all(color: AppColors.primaryColor)),
                      child: IconButton(
                        iconSize: 15,
                        color: AppColors.textcolor,
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              // Text(
              //   'My Name',
              //   style: TextStyle(color: AppColors.textcolor),
              // ),
              SizedBox(
                height: 35,
              ),
              info2(icon: Icons.person, title: 'Name', describtion: 'My Name'),
              SizedBox(
                height: 15,
              ),
              info2(
                  icon: Icons.email,
                  title: 'Email',
                  describtion: 'example@gmail.com'),
              SizedBox(
                height: 15,
              ),
              info2(
                  icon: Icons.phone,
                  title: 'Phone',
                  describtion: '+20 0101 254 1543'),
              SizedBox(
                height: 15,
              ),
              info2(icon: Icons.place, title: 'Address', describtion: 'Egept'),
            ],
          ),
        ),
      ),
    );
  }
}

// enum Draweritem {
//   home,
//   profile,
//   settings,
// }
