// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:sports_app/Data/Repository/Search_Players_Repo.dart';

// import '../Data/Cubits/Players_cubit/players_cubit.dart';
// import '../Data/Models/Players_Model.dart';

// part 'search_player_state.dart';

// class SearchPlayerCubit extends Cubit<SearchPlayerState> {
//   SearchPlayerCubit() : super(SearchPlayerInitial());

  
//   SearchPlayerRepo searchplayersRepo = SearchPlayerRepo();
  

//   getPlayers(context, {required String teamID}) async {
//     emit(SearchPlayersLoading());

//     try {
//       await SearchPlayerRepo.searchPlayer(teamID).then((value) {
//         if (value != null) {
//           emit(PlayersSuccess(response: value));
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const PlayersScreen()),
//           );
//         } else {
//           emit(PlayersError());
//         }
//       });
//     } catch (error) {
//       emit(PlayersError());
//     }
//   }
// }
