import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Shared/Colors.dart';

class TopScorers extends StatefulWidget {
  const TopScorers({super.key});

  @override
  State<TopScorers> createState() => _TopScorersState();
}

class _TopScorersState extends State<TopScorers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: AppColors.secondaryColor,
              height: 2,
              thickness: 2,
            );
          },
          itemCount: 6,
          itemBuilder: ((context, index) {
            return const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/RealMadried.com.png"),
              ),
              title: Text('Cristiano Ronaldo',style: TextStyle(color: Colors.white),),
              subtitle: Text('age : 37',style: TextStyle(color: Colors.white),),
            );
          }),
        ));
  }
}
