import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Players/Players_cubit/players_cubit.dart';

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
                childAspectRatio: 4.5,
                // Set the crossAxisSpacing and mainAxisSpacing to control the spacing between the containers
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                children: [
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocBuilder<PlayersCubit, PlayersState>(
                          builder: (context, state) {
                        if (state is PlayersLoading) {
                          return CircularProgressIndicator();
                        } else if (state is PlayersSuccess ||
                            state is PlayersInitial) {
                          return InkWell(
                            onTap: () {
                              context.read<PlayersCubit>().getPlayers(context);
                            },
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "RealMadrid",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Text('error');
                        }
                      }),
                    ),
                ],
              ),
            ),
          ],
        ));
  }
}
