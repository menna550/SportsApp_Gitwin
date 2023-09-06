// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
// import '../../Shared/Colors.dart';

// class TopScorersButtons extends StatefulWidget {
//   const TopScorersButtons({super.key});

//   @override
//   State<TopScorersButtons> createState() => _TopScorersButtonsState();
// }

// class _TopScorersButtonsState extends State<TopScorersButtons> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: AppColors.primaryColor,
//           body: BlocBuilder<TopScorersCubit, TopScorersState>(
//               builder: (context, state) {
//             if (state is TopScorersSuccess) {
//               return ListView.builder(
//                 // separatorBuilder: (context, index) {
//                 //   return Divider(
//                 //     color: AppColors.secondaryColor,
//                 //     height: 2,
//                 //     thickness: 2,
//                 //   );
//                 // },
//                 itemCount: state.response.result.length,
//                 itemBuilder: ((context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: Container(
//                         //padding: const EdgeInsets.only(bottom: 10.0),
//                         height: 70,
//                         width: MediaQuery.of(context).size.width / 2,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: AppColors.secondaryColor),
//                         child: ListTile(
//                           title: Text(
//                             state.response.result[index].playerName,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           subtitle: Text(
//                             'Scores : ${state.response.result[index].goals}',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ));
//                 }),
//               );
//             } else {
//               return Text('Error');
//             }
//           })),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Cubits/TopScorers_cubit/top_scorers_cubit.dart';
import '../../Shared/Colors.dart';

class TopScorersButtons extends StatefulWidget {
  const TopScorersButtons({super.key});

  @override
  State<TopScorersButtons> createState() => _TopScorersButtonsState();
}

class _TopScorersButtonsState extends State<TopScorersButtons> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Fetch the top scorers data when the widget is first initialized
  //   context.read<TopScorersCubit>().getTopScorers(context);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopScorersCubit, TopScorersState>(
        builder: (context, state) {
      // if (state is TopScorersInitial) {
      //   // Fetch the teams when the tab is first opened
      //   // context.read<TopScorersCubit>().getTopScorers(context);
      //   return Center(child: CircularProgressIndicator());
      // } else
      if (state is TopScorersLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is TopScorersSuccess) {
        return ListView.builder(
          // separatorBuilder: (context, index) {
          //   return Divider(
          //     color: AppColors.secondaryColor,
          //     height: 2,
          //     thickness: 2,
          //   );
          // },
          itemCount: state.response.result.length,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  //padding: const EdgeInsets.only(bottom: 10.0),
                  height: 70,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.secondaryColor),
                  child: ListTile(
                    title: Text(
                      state.response.result[index].playerName,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Scores : ${state.response.result[index].goals}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ));
          }),
        );
      } else {
        return Text('Error');
      }
    });
  }
}
