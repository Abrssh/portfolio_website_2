// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// // import 'package:intl/intl.dart';

// void main() async {
//   await dotenv.load(fileName: "api_key.env");
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Live Football Scores',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LiveScoresPage(),
//     );
//   }
// }

// class LiveScoresPage extends StatefulWidget {
//   const LiveScoresPage({super.key});

//   @override
//   _LiveScoresPageState createState() => _LiveScoresPageState();
// }

// class _LiveScoresPageState extends State<LiveScoresPage> {
//   // List<dynamic> fixtures = [];
//   // bool isLoading = true;
//   // final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchFixtures();
//   // }

//   List<dynamic> players = [];
//   bool isLoading = true;
//   String selectedMetric = 'goals';

//   @override
//   void initState() {
//     super.initState();
//     fetchPlayers(selectedMetric);
//   }

//   Future<void> fetchPlayers(String metric) async {
//     setState(() {
//       isLoading = true;
//     });
//     late String endpoint;
//     final apiKey = dotenv.env['rapidapi_football_api_key'];

//     switch (metric) {
//       case "goals":
//         endpoint =
//             "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-goals?leagueid=47";
//       case "assists":
//         endpoint =
//             "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-assists?leagueid=47";
//       case "rating":
//         endpoint =
//             "https://free-api-live-football-data.p.rapidapi.com/football-get-top-players-by-rating?leagueid=47";
//         break;
//       default:
//     }

//     final response = await http.get(
//       Uri.parse(endpoint),
//       headers: {
//         'X-RapidAPI-Key': apiKey!,
//         'X-RapidAPI-Host': 'free-api-live-football-data.p.rapidapi.com',
//       },
//     );

//     if (response.statusCode == 200) {
//       setState(() {
//         players = json.decode(response.body)['response']['players'];
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       debugPrint('Failed to fetch players');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Live Football Scores'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 const Text('Sort by: '),
//                 DropdownButton<String>(
//                   value: selectedMetric,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedMetric = newValue!;
//                       isLoading = true;
//                     });
//                     fetchPlayers(selectedMetric);
//                   },
//                   items: <String>['goals', 'assists', 'rating']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//           isLoading
//               ? const Center(
//                   child: SpinKitFadingCircle(
//                     color: Colors.blue,
//                     size: 50.0,
//                   ),
//                 )
//               : Expanded(
//                   child: ListView.builder(
//                     itemCount: players.length,
//                     itemBuilder: (context, index) {
//                       final player = players[index];
//                       final String stat =
//                           players[index][selectedMetric].toString();
//                       return Card(
//                         color: parseColor(player['teamColors']['lightMode']),
//                         margin: const EdgeInsets.all(10.0),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundColor:
//                                 parseColor(player['teamColors']['darkMode']),
//                             child: Text(
//                               // player['goals'].toString(),
//                               stat,
//                               style: TextStyle(
//                                 color: parseColor(
//                                     player['teamColors']['fontLightMode']),
//                               ),
//                             ),
//                           ),
//                           title: Text(
//                             player['name'],
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           subtitle: Text(
//                             'Team: ${player['teamName']}\n$selectedMetric: $stat',
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           trailing: const Icon(
//                             Icons.sports_soccer,
//                             color: Colors.white,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }

//   Color parseColor(String colorCode) {
//     try {
//       if (colorCode.startsWith('#')) {
//         // Handle hex color
//         return Color(
//             int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
//       } else if (colorCode.startsWith('rgba')) {
//         // Handle RGBA color
//         final rgba = colorCode
//             .replaceAll(
//                 RegExp(r'[rgba() ]'), '') // Remove "rgba(", ")", and spaces
//             .split(',')
//             .map((value) => double.parse(value))
//             .toList();
//         return Color.fromRGBO(
//             rgba[0].toInt(), rgba[1].toInt(), rgba[2].toInt(), rgba[3]);
//       } else {
//         throw const FormatException("Unsupported color format");
//       }
//     } catch (e) {
//       debugPrint("Error parsing color: $colorCode, error: $e");
//       return Colors.transparent; // Default fallback color
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:intl/intl.dart';

void main() async {
  await dotenv.load(fileName: "api_key.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Football Scores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 4.0,
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: const CardTheme(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
      home: const LiveScoresPage(),
    );
  }
}

class LiveScoresPage extends StatefulWidget {
  const LiveScoresPage({super.key});

  @override
  _LiveScoresPageState createState() => _LiveScoresPageState();
}

class _LiveScoresPageState extends State<LiveScoresPage> {
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
    }

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
    } else {
      setState(() {
        isLoading = false;
      });
      debugPrint('Failed to fetch players');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Football Scores'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
