import 'package:flutter/material.dart';
import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';
import 'package:portfolio_website_2/MVVM/ViewModel/Interface/get_top_player_data.dart';

class FootballApiSecViewModel extends ChangeNotifier {
  final GetTopPlayersUseCase getTopPlayersUseCase;

  // FootballApiSecViewModel({required this.getTopPlayersUseCase});
  FootballApiSecViewModel({required this.getTopPlayersUseCase}) {
    fetchTopPlayers("goals");
  }

  final List<TopPlayer> _topPlayers = [];

  String _selectedMetric = "goals";

  bool isLoading = false;

  bool fetchPlayersError = false;

  String fetchPlayersErrorMessage = "";

  List<TopPlayer> get topPlayers => _topPlayers;

  String get selectedMetricValue => _selectedMetric;

  set selectedMetricValue(String value) {
    if (value == "goals" || value == "assists" || value == "rating") {
      _selectedMetric = value;
      fetchTopPlayers(value);
      notifyListeners(); // Notify listeners if the metric changes
    } else {
      throw ArgumentError('Invalid metric value: $value');
    }
  }

  String getErrorMessage(Exception e) {
    if (e.toString().contains("Unauthorized access")) {
      return "Unauthorized access. API needs to be Updated.";
    } else if (e.toString().contains("API limit exceeded")) {
      return "API limit exceeded. Please try again later.";
    } else if (e.toString().contains("Data not found")) {
      return "Data not found. API endpoint may have changed.";
    } else if (e.toString().contains("Server error")) {
      return "Server error. Please try again later.";
    } else {
      return "Failed to fetch players. Error code: ${e.toString()}";
    }
  }

  void fetchTopPlayers(String metric) async {
    try {
      isLoading = true;

      List<TopPlayer> tempTopPlayers =
          await getTopPlayersUseCase.fetchTopPlayers(metric);

      // Use this to not exhaust your API limit
      // List<TopPlayer> tempTopPlayers = [];
      // await Future.delayed(const Duration(seconds: 2));
      // if ("goals" == metric) {
      //   tempTopPlayers.add(TopPlayer(
      //       name: "Cristiano Ronaldo",
      //       teamName: "Manchester United",
      //       teamLightColor: "#DA291C",
      //       teamDarkColor: "#000000",
      //       teamFontLightColor: "#FFFFFF",
      //       goals: 10,
      //       assists: 5,
      //       rating: 4.8));
      //   tempTopPlayers.add(TopPlayer(
      //       name: "Lionel Messi",
      //       teamName: "Paris Saint-Germain",
      //       teamLightColor: "#032B44",
      //       teamDarkColor: "#032B44",
      //       teamFontLightColor: "#FFFFFF",
      //       goals: 12,
      //       assists: 7,
      //       rating: 4.9));
      // } else {
      //   tempTopPlayers.add(TopPlayer(
      //       name: "Kylian Mbapp ",
      //       teamName: "Paris Saint-Germain",
      //       teamLightColor: "#032B44",
      //       teamDarkColor: "#032B44",
      //       teamFontLightColor: "#FFFFFF",
      //       goals: 15,
      //       assists: 8,
      //       rating: 5.0));
      //   tempTopPlayers.add(TopPlayer(
      //       name: "Harry Kane",
      //       teamName: "Tottenham Hotspur",
      //       teamLightColor: "#132257",
      //       teamDarkColor: "#132257",
      //       teamFontLightColor: "#FFFFFF",
      //       goals: 18,
      //       assists: 9,
      //       rating: 4.7));
      // }

      _topPlayers.clear();
      _topPlayers.addAll(tempTopPlayers);
      fetchPlayersError = false;
      fetchPlayersErrorMessage = "";
    } catch (e) {
      fetchPlayersError = true;
      fetchPlayersErrorMessage = getErrorMessage(e as Exception);
      debugPrint("fetchTopPlayer ViewModel Error: $fetchPlayersErrorMessage");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateTopPlayers() {
    notifyListeners();
  }
}

class RebuildVariablesForFootballAPISection {
  final bool isLoading, isError;
  final List<TopPlayer> topPlayers;
  final String errorMessage;

  RebuildVariablesForFootballAPISection(
      {required this.isLoading,
      required this.topPlayers,
      required this.isError,
      required this.errorMessage});
}
