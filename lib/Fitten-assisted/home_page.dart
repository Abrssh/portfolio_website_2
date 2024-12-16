import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> matches = [];

  @override
  void initState() {
    super.initState();
    fetchFootballMatches();
  }

  // Future<void> fetchFootballMatches() async {
  //   try {
  //     final response = await http.get(
  //         Uri.parse('https://api.football-data.org/v2/matches'),
  //         headers: {'X-Auth-Token': '249430e300f0426ab5a76c7051f01f61'});
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         matches = json.decode(response.body)['matches'];
  //       });
  //     } else {
  //       print('Failed to load matches');
  //       throw Exception('Failed to load matches');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Future<void> fetchFootballMatches() async {
    try {
      final response = await http.get(
          Uri.parse('https://api.football-data.org/v4/matches'),
          headers: {'X-Auth-Token': '249430e300f0426ab5a76c7051f01f61'});
      debugPrint("Response status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        setState(() {
          matches = json.decode(response.body)['matches'];
        });
      } else {
        debugPrint('Error: ${response.statusCode} ${response.reasonPhrase}');
        debugPrint('Response body: ${response.body}');
        throw Exception('Failed to load matches');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeSection(),
            ExperiencesSection(),
            PortfolioSection(),
            ContactSection(),
            ApiSection(matches: matches),
          ],
        ),
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Welcome to My Portfolio',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'This is a brief introduction to myself.',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ExperiencesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 600),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: ScaleAnimation(
                child: ExperienceCard(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.purple[800],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Experience ${DateTime.now().millisecondsSinceEpoch}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: PortfolioCard(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.purple[800],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Project ${DateTime.now().millisecondsSinceEpoch}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Upwork', style: TextStyle(color: Colors.blue)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Fiverr', style: TextStyle(color: Colors.green)),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Email', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ApiSection extends StatelessWidget {
  final List<dynamic> matches;

  ApiSection({required this.matches});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'API Section',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final match = matches[index];
              return ListTile(
                title: Text(
                  '${match['homeTeam']['name']} vs ${match['awayTeam']['name']}',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Status: ${match['status']}',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
