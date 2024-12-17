import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FootballApiSection extends StatefulWidget {
  const FootballApiSection({super.key});

  @override
  State<FootballApiSection> createState() => _FootballApiSectionState();
}

class _FootballApiSectionState extends State<FootballApiSection> {
  List<dynamic> players = [];
  bool isLoading = true;
  String selectedMetric = 'goals';

  @override
  void initState() {
    super.initState();
    fetchPlayers(selectedMetric);
  }

  Future<void> fetchPlayers(String metric) async {
    setState(() {
      isLoading = true;
    });
    late String endpoint;
    final apiKey = dotenv.env['rapidapi_football_api_key'];

    switch (metric) {
      case "goals":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-goals?leagueid=47";
        break;
      case "assists":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-assists?leagueid=47";
        break;
      case "rating":
        endpoint =
            "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-rating?leagueid=47";
        break;
      default:
        setState(() {
          isLoading = false;
        });
        showSnackBar("Invalid sorting metric selected.");
        return;
    }

    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'X-RapidAPI-Key': apiKey!,
          'X-RapidAPI-Host': 'free-api-live-football-data.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          players = json.decode(response.body)['response']['players'];
          isLoading = false;
        });
      } else if (response.statusCode == 401) {
        showSnackBar("Unauthorized access. API needs to be Updated.");
      } else if (response.statusCode == 403) {
        showSnackBar("API limit exceeded. Please try again later.");
      } else if (response.statusCode == 404) {
        showSnackBar("Data not found. API endpoint may have changed.");
      } else if (response.statusCode == 500) {
        showSnackBar("Server error. Please try again later.");
      } else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
            "Failed to fetch players. Error code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar("An error occurred. Please try again later.");
      debugPrint('Exception: $e');
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Text(
            "API Demonstration",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          Text(
            "Find out the best players in the Premier League",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sort by: ',
                  style: TextStyle(fontSize: 18.0),
                ),
                DropdownButton<String>(
                  value: selectedMetric,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMetric = newValue!;
                      isLoading = true;
                    });
                    fetchPlayers(selectedMetric);
                  },
                  items: <String>['goals', 'assists', 'rating']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    );
                  }).toList(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                ),
              ],
            ),
          ),
          isLoading
              ? const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: players.length,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    itemBuilder: (context, index) {
                      final player = players[index];
                      final String stat =
                          players[index][selectedMetric].toString();
                      return Card(
                        color: parseColor(player['teamColors']['lightMode']),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 16.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                parseColor(player['teamColors']['darkMode']),
                            radius: 25.0,
                            child: Text(
                              stat,
                              style: TextStyle(
                                color: parseColor(
                                    player['teamColors']['fontLightMode']),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          title: Text(
                            player['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          subtitle: Text(
                            'Team: ${player['teamName']}\n$selectedMetric: $stat',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.sports_soccer,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  Color parseColor(String colorCode) {
    try {
      if (colorCode.startsWith('#')) {
        // Handle hex color
        return Color(
            int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
      } else if (colorCode.startsWith('rgba')) {
        // Handle RGBA color
        final rgba = colorCode
            .replaceAll(
                RegExp(r'[rgba() ]'), '') // Remove "rgba(", ")", and spaces
            .split(',')
            .map((value) => double.parse(value))
            .toList();
        return Color.fromRGBO(
            rgba[0].toInt(), rgba[1].toInt(), rgba[2].toInt(), rgba[3]);
      } else {
        throw const FormatException("Unsupported color format");
      }
    } catch (e) {
      debugPrint("Error parsing color: $colorCode, error: $e");
      return Colors.transparent; // Default fallback color
    }
  }
}
