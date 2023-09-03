import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Shared/Colors.dart';

class TeamsButton extends StatefulWidget {
  const TeamsButton({super.key});

  @override
  State<TeamsButton> createState() => _TeamsButtonState();
}

class _TeamsButtonState extends State<TeamsButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                // Set the childAspectRatio to control the size of the container
                  childAspectRatio: 4.0,
                   // Set the crossAxisSpacing and mainAxisSpacing to control the spacing between the containers
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                children: [
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.secondaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/RealMadried.com.png",
                                    width: 50, height: 50),
                                const SizedBox(width:10,),
                                const Text(
                                  "RealMadrid",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
