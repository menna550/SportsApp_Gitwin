import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Cubits/Lega_cubit/get_lega_cubit.dart';
import '../../Data/Cubits/Teams_cubit/teams_cubit.dart';

class Lega extends StatelessWidget {
  const Lega({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/Soccer.jpg',
                fit: BoxFit.fill,
              )),
          BlocBuilder<GetLegaCubit, GetLegaState>(
            builder: (context, state) {
              if (state is GetLegaSuccess) {
                return ListView(
                  children: [
                    for (int i = 0; i < state.response.result!.length; i++)
                      Container(
                        color: Color.fromARGB(179, 199, 197, 196),
                        height: 1000,
                        child: BlocBuilder<TeamsCubit, TeamsState>(
                            builder: (context, teamstate) {
                          if (teamstate is TeamsLoading)
                            return CircularProgressIndicator();
                          else if (teamstate is TeamsSuccess ||
                              teamstate is TeamsInitial) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<TeamsCubit>()
                                    .getTeams(context);
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    state.response.result?[i].leagueLogo ?? "",
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                  ),
                                  //SizedBox(height: 8,),
                                  Text(
                                      state.response.result?[i].leagueName
                                          as String,
                                      style: TextStyle(color: Colors.white)),
                                  // SizedBox(height: 8,),
                                ],
                              ),
                            );
                          } else {
                            return const Text("error");
                          }
                        }),
                      ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                );
              } else {
                return const Text("error");
              }
            },
          ),
        ],
      ),
    ));
  }
}
