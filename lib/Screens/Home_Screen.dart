import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Shared/Colors.dart';

class home_screen extends StatelessWidget {
  home_screen({super.key});

  List name = ["Basketball", "tennis", "Cricket"];
  List logo = [
    "assets/pngegg.png",
    "assets/pngwing.com (1).png",
    "assets/pngwing.com.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // left: true,
      // right: true,
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            children: [
              const SizedBox(height: 50),
              const Text("Choose Your Favourite Sport",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              const SizedBox(height: 140),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.secondaryColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/image 132.png",
                                  width: 50, height: 50),
                              const Text(
                                "Football",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    for (int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Coming Soon",
                                      style:
                                          TextStyle(color: Color(0xFF112A46)),
                                    ),
                                    content: const Text(' stay tuned',
                                        style: TextStyle(
                                            color: Color(0xFF112A46))),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text('Close '))
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.secondaryColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(logo[i], width: 50, height: 50),
                                Text(
                                  name[i],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
