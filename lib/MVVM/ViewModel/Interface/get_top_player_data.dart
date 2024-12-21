import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';

abstract class GetTopPlayersUseCase {
  Future<List<TopPlayer>> fetchTopPlayers(String metric);
}
