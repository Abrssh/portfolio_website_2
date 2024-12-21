import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';
import 'package:portfolio_website_2/MVVM/Model/Data/rapid_api_datasource.dart';
import 'package:portfolio_website_2/MVVM/ViewModel/Interface/get_top_player_data.dart';

class GetTopPlayerImplementation implements GetTopPlayersUseCase {
  final RapidApiDataSource rapidApiDataSource;

  GetTopPlayerImplementation({required this.rapidApiDataSource});

  @override
  Future<List<TopPlayer>> fetchTopPlayers(String metric) async {
    try {
      List<dynamic> fetchedPlayers =
          await rapidApiDataSource.fetchPlayers(metric);
      // return fetchedPlayers.map((player) {
      //   TopPlayer topPlayer = TopPlayer.fromJson(player);
      //   return topPlayer;
      // }).toList();
      return fetchedPlayers
          .map((player) => TopPlayer.fromJson(player))
          .toList();
    } catch (e) {
      throw Exception("An error occurred while processing player data: $e");
    }
  }
}
