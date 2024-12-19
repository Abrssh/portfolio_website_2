import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';
import 'package:portfolio_website_2/MVVM/ViewModel/Interface/get_top_player_data.dart';

class FootballApiSecViewModel extends ChangeNotifier {
  final GetTopPlayers getTopPlayers;

  FootballApiSecViewModel({required this.getTopPlayers});

  final List<TopPlayer> _topPlayers = [];

  List<TopPlayer> get topPlayers => _topPlayers;

  Future<List<TopPlayer>> fetchTopPlayers(String metric) async {
    // List<TopPlayer> tempTopPlayers =
    //     await getTopPlayers.fetchTopPlayers(metric);
    List<TopPlayer> tempTopPlayers = [];
    await Future.delayed(const Duration(seconds: 2));
    if ("goals" == metric) {
      tempTopPlayers.add(TopPlayer(
          name: "Cristiano Ronaldo",
          teamName: "Manchester United",
          teamLightColor: "#DA291C",
          teamDarkColor: "#000000",
          teamFontLightColor: "#FFFFFF",
          goals: 10,
          assists: 5,
          rating: 4.8));
      tempTopPlayers.add(TopPlayer(
          name: "Lionel Messi",
          teamName: "Paris Saint-Germain",
          teamLightColor: "#032B44",
          teamDarkColor: "#032B44",
          teamFontLightColor: "#FFFFFF",
          goals: 12,
          assists: 7,
          rating: 4.9));
    } else {
      tempTopPlayers.add(TopPlayer(
          name: "Kylian Mbapp ",
          teamName: "Paris Saint-Germain",
          teamLightColor: "#032B44",
          teamDarkColor: "#032B44",
          teamFontLightColor: "#FFFFFF",
          goals: 15,
          assists: 8,
          rating: 5.0));
      tempTopPlayers.add(TopPlayer(
          name: "Harry Kane",
          teamName: "Tottenham Hotspur",
          teamLightColor: "#132257",
          teamDarkColor: "#132257",
          teamFontLightColor: "#FFFFFF",
          goals: 18,
          assists: 9,
          rating: 4.7));
    }

    _topPlayers.clear();
    _topPlayers.addAll(tempTopPlayers);
    return _topPlayers;
  }

  void updateTopPlayers() {
    notifyListeners();
  }
}
