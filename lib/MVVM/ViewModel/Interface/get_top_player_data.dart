import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';

abstract class GetTopPlayers {
  Future<List<TopPlayer>> fetchTopPlayers(String metric);
}
