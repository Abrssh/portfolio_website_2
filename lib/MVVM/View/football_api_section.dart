import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio_website_2/MVVM/Model/Class/top_player.dart';
import 'package:portfolio_website_2/MVVM/ViewModel/football_api_section_viewmodel.dart';
import 'package:provider/provider.dart';

class FootballApiSection extends StatefulWidget {
  const FootballApiSection({super.key});

  @override
  State<FootballApiSection> createState() => _FootballApiSectionState();
}

class _FootballApiSectionState extends State<FootballApiSection> {
  String selectedMetric = 'goals';

  @override
  void initState() {
    super.initState();
    // fetchPlayers(selectedMetric);
  }

  String getErrorMessage(Exception e) {
    debugPrint("GetErrorMessage: $e");
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

  void showSnackBarforError(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
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
                    });
                    context.read<FootballApiSecViewModel>().fetchTopPlayers(
                        selectedMetric); // listen is set to false when you use context
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
          Consumer<FootballApiSecViewModel>(
            builder: (context, value, child) {
              try {
                return Expanded(
                    child: FutureBuilder<List<TopPlayer>>(
                        future: context
                            .read<FootballApiSecViewModel>()
                            .fetchTopPlayers(selectedMetric),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            debugPrint(
                                "1snapshot has data ${snapshot.hasData} snapshot data: ${snapshot.data} Connection state: ${snapshot.connectionState}");
                            return const Center(
                              child: SpinKitFadingCircle(
                                color: Colors.blue,
                                size: 50.0,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            debugPrint(
                                "snapshot has data ${snapshot.hasData} snapshot data: ${snapshot.data} Connection state: ${snapshot.connectionState}");
                            final List<TopPlayer> topPlayers = snapshot.data!;
                            return ListView.builder(
                              itemCount: topPlayers.length,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              itemBuilder: (context, index) {
                                final TopPlayer topPlayer = topPlayers[index];
                                late final String metricStat;
                                switch (selectedMetric) {
                                  case "goals":
                                    metricStat = topPlayer.goals.toString();
                                    break;
                                  case "assists":
                                    metricStat = topPlayer.assists.toString();
                                    break;
                                  case "rating":
                                    metricStat = topPlayer.rating.toString();
                                    break;
                                  default:
                                    metricStat = "";
                                }
                                return Card(
                                  color: parseColor(topPlayer.teamLightColor),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 16.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          parseColor(topPlayer.teamDarkColor),
                                      radius: 50.0,
                                      child: Text(
                                        selectedMetric,
                                        style: TextStyle(
                                          color: parseColor(
                                              topPlayer.teamFontLightColor),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      topPlayer.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Team: ${topPlayer.teamName}\n$selectedMetric: $metricStat',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    trailing: child,
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            showSnackBarforError(
                                getErrorMessage(snapshot.error as Exception));
                            return Center(
                              child: Text(
                                'No data available because of ${snapshot.error.toString()}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            );
                          } else {
                            return const Center(
                              child: SpinKitFadingCircle(
                                color: Colors.blue,
                                size: 50.0,
                              ),
                            );
                          }
                        }));
              } catch (e) {
                showSnackBarforError(getErrorMessage(e as Exception));
                return Center(
                  child: Text(
                    'No data available because of ${e.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }
            },
            child: const Icon(
              Icons.sports_soccer,
              color: Colors.white,
              size: 30.0,
            ), // child can be commented out if not needed
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
