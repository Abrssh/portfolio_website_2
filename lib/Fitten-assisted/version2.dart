import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "api_key.env");
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

  Future<void> fetchFootballMatches() async {
    try {
      final String? apiKey = dotenv.env['football_api_key'];
      final response = await http.get(
        Uri.parse('https://api.football-data.org/v4/matches'),
        headers: {'X-Auth-Token': apiKey!},
      );
      if (response.statusCode == 200) {
        setState(() {
          matches = json.decode(response.body)['matches'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to load matches'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
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
      padding: EdgeInsets.all(40),
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
            style: TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'This is a brief introduction to myself.',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class ExperiencesSection extends StatelessWidget {
  final List<String> experiences = [
    'Experience 1',
    'Experience 2',
    'Experience 3',
    'Experience 4',
    'Experience 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experiences',
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: experiences.map((experience) {
                return AnimationConfiguration.staggeredList(
                  position: experiences.indexOf(experience),
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ExperienceCard(experience: experience),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String experience;

  ExperienceCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.purple[800],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          experience,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  final List<String> projects = [
    'Project 1',
    'Project 2',
    'Project 3',
    'Project 4',
    'Project 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: projects.map((project) {
                return AnimationConfiguration.staggeredList(
                  position: projects.indexOf(project),
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: PortfolioCard(project: project),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  final String project;

  PortfolioCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.purple[800],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          project,
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
      padding: EdgeInsets.all(40),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  // Open Upwork profile
                  launchURL('https://www.upwork.com/freelancers/~yourusername');
                },
                child: Text('Upwork', style: TextStyle(color: Colors.blue)),
              ),
              TextButton(
                onPressed: () {
                  // Open Fiverr profile
                  launchURL('https://www.fiverr.com/yourusername');
                },
                child: Text('Fiverr', style: TextStyle(color: Colors.green)),
              ),
              TextButton(
                onPressed: () {
                  // Open Email
                  launchURL('mailto:your.email@example.com');
                },
                child: Text('Email', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ApiSection extends StatelessWidget {
  final List<dynamic> matches;

  ApiSection({required this.matches});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.black.withOpacity(0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'API Section',
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          matches.isEmpty
              ? CircularProgressIndicator(color: Colors.white)
              : ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: matches.length
                      .clamp(0, 10), // Display only top 10 matches
                  itemBuilder: (context, index) {
                    final match = matches[index];
                    return ListTile(
                      title: Text(
                        '${match['homeTeam']['name']} vs ${match['awayTeam']['name']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        // 'Status: ${match['status']}',
                        'Score: ${match['score']['fullTime']['homeTeam']} - ${match['score']['fullTime']['awayTeam']}',
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
