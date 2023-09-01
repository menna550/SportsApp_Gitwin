import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';

class Countries_Screen extends StatelessWidget {
  const Countries_Screen({super.key});

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
                'images/istockphoto-512735894-612x612.jpg',
                fit: BoxFit.fill,
              )),
          BlocBuilder<CountriesCubit, CountriesState>(
            builder: (context, state) {
              




              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  for (int i = 0; i < 50; i++)
                    Container(
                      color: Color.fromARGB(179, 199, 197, 196),
                      width: 5,
                      height: 5,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              "images/istockphoto-1132841674-612x612-removebg-preview.png",
                              height: MediaQuery.of(context).size.height * 0.12,
                            ),
                            //SizedBox(height: 8,),
                            Text('Egypt',
                                style: TextStyle(color: Colors.white)),
                            // SizedBox(height: 8,),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 8,
                  ),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                  // Image.asset("images/Flag_of_Egypt.svg.png"),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}
