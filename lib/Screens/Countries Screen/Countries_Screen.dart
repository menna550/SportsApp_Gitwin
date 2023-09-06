// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
// import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
// import 'package:sports_app/Data/Models/Countries_Model.dart';
// import 'package:sports_app/Data/Models/Countries_Model.dart';
// import 'package:sports_app/Data/Models/Countries_Model.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:sports_app/Shared/Colors.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:geocoding/geocoding.dart';

// import '../../Data/Models/Countries_Model.dart';
// import '../../Shared/Drawer_List.dart';
// import '../../Shared/Drawer_header.dart';
// import '../Players_Screen/players.dart';
// import '../Drawer/Profile_screen.dart';
// import '../Drawer/Settings_screen.dart';



// class Countries_Screen extends StatefulWidget {
//   Countries_Screen({super.key});

//   @override
//   State<Countries_Screen> createState() => _Countries_ScreenState();
// }

// class _Countries_ScreenState extends State<Countries_Screen> {
//   GlobalKey key = GlobalKey();

//   ScrollController sc = ScrollController();

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        drawer: Drawer(
//               backgroundColor: AppColors.textcolor,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     MyDrawerHeader(),
//                  //  MyDrawerList(v: Draweritem.home ),
//                   ],
//                 ),
//               )),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             Container(
//                 height: MediaQuery.of(context).size.height,
//                 child: Image.asset(
//                   'assets/istockphoto-512735894-612x612.jpg',
//                   fit: BoxFit.fill,
//                 )),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.2,
//               child: Column(children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.1,
//                 ),
//                 BlocBuilder<LocationCubitCubit, LocationCubitState>(
//                   builder: (context, state) {
//                     return Row(children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 30, right: 10),
//                         child: Container(
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(width: 3, color: Colors.white),
//                                 color: AppColors.secondaryColor,
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Center(
//                               child: Text(
//                                 context.read<LocationCubitCubit>().location,
//                                 style: TextStyle(color: AppColors.textcolor),
//                               ),
//                             )),
//                       ),
//                       IconButton(
//                         onPressed: () async {

                          
//                           await context
//                               .read<LocationCubitCubit>()
//                               .getPosition(context);

//                               setState(() {
                                
//                               });

                            

//                           RenderBox box = key.currentContext?.findRenderObject()
//                               as RenderBox;
//                           Offset position = box.localToGlobal(
//                               Offset.zero); //this is global position
//                           double y = position.dy;

//                           sc.animateTo(y,
//                               duration: Duration(seconds: 1),
//                               curve: Curves.easeIn);

//                              // print(key);
//                         },
//                         icon: Icon(
//                           Icons.location_on_sharp,
//                         ),
//                         iconSize: MediaQuery.of(context).size.height * 0.05,
//                         color: Colors.white,
//                       )
                      
//                     ]);
//                   },
//                 ),
//               ]),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                   height: MediaQuery.of(context).size.height * 0.8,
//                   child: BlocBuilder<CountriesCubit, CountriesState>(
//                     builder: (context, state) {
//                       if (state is CountriesSuccess) {
//                         return GridView.count(
//                           controller: sc,
//                           primary: false,
//                           padding: const EdgeInsets.all(20),
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                           crossAxisCount: 3,
//                           children: <Widget>[
//                             for (int i = 0;
//                                 i < state.response.result.length;
//                                 i++)
//                               InkWell(
//                                 onTap: () {},
//                                 child: Column(children: [
//                                   if (context.read<LocationCubitCubit>().s ==
//                                       state.response.result[i].countryName)
//                                     Container(
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                             width: 4,
//                                             color: Colors.white,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: CircleAvatar(
//                                         radius: 31,
//                                         backgroundImage: NetworkImage(
//                                           state.response.result[i]
//                                                   .countryLogo ??
//                                               "",
//                                           // height: MediaQuery.of(context).size.height * 0.12,
//                                         ),
                                        
//                                       ),
//                                       key: key,
//                                     ),
//                                   if (context.read<LocationCubitCubit>().s !=
//                                       state.response.result[i].countryName)
//                                     CircleAvatar(
//                                       backgroundColor: AppColors.secondaryColor,
//                                       radius: 31,
//                                       backgroundImage: NetworkImage(
//                                         state.response.result[i].countryLogo ??
//                                             "",
//                                       ),
                                     
//                                     ),
                                    
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   Text(state.response.result[i].countryName,
//                                       style: TextStyle(color: Colors.white)),
//                                 ]),
//                               )
//                           ],
//                         );
//                       } else {
//                         return Text('Something Went Wrong !');
//                       }
//                     },
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Cubits_Logic/Countries_Screen_Logic/location_cubit_cubit.dart';
import 'package:sports_app/Data/Cubits/Countries_cubit/countries_cubit.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:sports_app/Data/Models/Countries_Model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sports_app/Shared/Colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geocoding/geocoding.dart';

import '../../Data/Models/Countries_Model.dart';

String s = "", street = "",gover="";

class Countries_Screen extends StatefulWidget {
  Countries_Screen({super.key});

  @override
  State<Countries_Screen> createState() => _Countries_ScreenState();
}

GlobalKey key = GlobalKey();

class _Countries_ScreenState extends State<Countries_Screen> {
  
 late ScrollController sc ;

  @override
  void initState() {
    sc =  ScrollController();
    sc.addListener(() {
      print(sc.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Position pos;

    Future getPosition() async {
      bool services;

      services = await Geolocator.isLocationServiceEnabled();
      LocationPermission per;

      if (services == false) {
        AwesomeDialog(
            context: context,
            title: "Services",
            body: Text("Location Not Enabled"))
          ..show();
      }

      per = await Geolocator.checkPermission();

      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();

        if (per == LocationPermission.always) {
          Future<Position> getlatAndlong() async {
            pos = await Geolocator.getCurrentPosition().then((value) => value);
            //  print(pos.latitude);
            //  print(pos.longitude);
            return pos;
          }
        }
      } else if (per == LocationPermission.always ||
          per == LocationPermission.whileInUse) {
        Future<Position> getlatAndlong() async {
          return await Geolocator.getCurrentPosition().then((value) => value);
          //  print(pos.latitude);
          //  print(pos.longitude);
        }

        pos = await getlatAndlong();

        List<Placemark> placemarks =
            await placemarkFromCoordinates(pos.latitude, pos.longitude);
        // print(placemarks[0].country);
        s = placemarks[0].country as String;
        street = placemarks[0].street as String;
        gover = "${placemarks[0].locality as String} , ";
      }

      


    }

    return Scaffold(
      
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/istockphoto-512735894-612x612.jpg',
              fit: BoxFit.fill,
            )),
        BlocBuilder<CountriesCubit, CountriesState>(
          builder: (context, state) {
            if (state is CountriesSuccess) {
              return SingleChildScrollView(
                 controller: sc,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 3, color: Colors.white),
                                  color: AppColors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text("${gover}${s}"
                                  ,
                                  style: TextStyle(color: AppColors.textcolor),
                                ),
                              )),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.location_on_sharp,
                          ),
                          onPressed: () async {
                            
                            await getPosition();
                            
                            setState(() {});

                            await Future.delayed(Duration(milliseconds: 100));

                            RenderBox box = key.currentContext
                                ?.findRenderObject() as RenderBox;
                            Offset position = box.localToGlobal(
                                Offset.zero); //this is global position
                            double y = position.dy;
                              sc.animateTo(y,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);

                                
                            

                              

                            
                            
                          },
                          iconSize: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      children: [
                        for (int i = 0; i < state.response.result.length; i++)
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                if (s == state.response.result[i].countryName)
                                  //get(sc.offset),
                                  // offest1=sc.offset;
                    
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color: Colors.white,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundImage: NetworkImage(
                                        state.response.result[i].countryLogo ??
                                            "",
                                        // height: MediaQuery.of(context).size.height * 0.12,
                                      ),
                                    ),
                                    key: key,
                                  ),
                                // if(s==state.response.result[i].countryName)
                                // get(sc.offset),
                    
                                if (s != state.response.result[i].countryName)
                                  CircleAvatar(
                                    radius: 31,
                                    backgroundImage: NetworkImage(
                                      state.response.result[i].countryLogo ??
                                          "",
                                      // height: MediaQuery.of(context).size.height * 0.12,
                                    ),
                                  ),
                    
                                SizedBox(
                                  height: 8,
                                ),
                                Text(state.response.result[i].countryName,
                                    style: TextStyle(color: Colors.white)),
                                // SizedBox(height: 8,),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else
              return Text('error');
          },
        ),
      ]),
    ));
  }
}

