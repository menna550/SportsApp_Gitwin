import 'package:flutter/material.dart';

import '../../Shared/Colors.dart';
import '../../Shared/Drawer_List.dart';
import '../../Shared/Drawer_header.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.textcolor),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      drawer: Drawer(
          backgroundColor: AppColors.textcolor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyDrawerHeader(),
                MyDrawerList(v: Draweritem.settings),
              ],
            ),
          )),
    );
  }
}
