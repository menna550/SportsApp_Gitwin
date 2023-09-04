import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/cubit/cubit/get_lega_cubit.dart';

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
                    for (int i = 0; i < 30; i++)
                      Container(
                        color: Color.fromARGB(179, 199, 197, 196),
                        height: 1000,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Image.network(
                                state.response.result?[i].leagueLogo ?? "",
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),

                              //SizedBox(height: 8,),
                              Text(
                                  state.response.result?[i].leagueName
                                      as String,
                                  style: TextStyle(color: Colors.white)),
                              // SizedBox(height: 8,),
                            ],
                          ),
                        ),
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