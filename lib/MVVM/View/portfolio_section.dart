import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website_2/MVVM/View/portfolio_items.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> portfolioItems = _addPortfolioItems(context);

    // final List<Widget> portfolioItems = [];
    // for (int i = 0; i < 5; i++) {
    //   portfolioItems.add(
    //     _buildPortfolioItem2(
    //       context,
    //       'Project Title',
    //       'It’s a simple game which I made for the ethiopian game market which was lacking in quantity and quality at the time. I relesed it to the play store when I was in University and was getting moderate success and growing until my PlayStore was shut down because of a fiverr scam. I made everything from scratch including the art using inkscape to the code using C# in unity. ',
    //       'https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600',
    //       [
    //         {
    //           'icon': FontAwesomeIcons.github,
    //           'url': 'https://github.com/user/project'
    //         },
    //         {
    //           'icon': FontAwesomeIcons.linkedin,
    //           'url': 'https://linkedin.com/in/project'
    //         },
    //         {
    //           'icon': FontAwesomeIcons.youtube,
    //           'url': 'https://youtube.com/watch?v=project'
    //         },
    //       ],
    //     ),
    //   );
    // }

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.92,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 650),
                    child: SlideAnimation(
                      // verticalOffset: 50.0,
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: portfolioItems[index]),
                    ),
                  );
                },
                itemCount: portfolioItems.length,
                // shrinkWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildPortfolioItem(BuildContext context, String title,
  //     String description, String url, IconData icon) {
  //   return Container(
  //     width: 300,
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           title,
  //           style: Theme.of(context).textTheme.titleLarge,
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           description,
  //           style: Theme.of(context).textTheme.bodyMedium,
  //         ),
  //         const SizedBox(height: 16),
  //         TextButton.icon(
  //           onPressed: () => _launchUrl(url),
  //           icon: FaIcon(icon),
  //           label: const Text('View Project'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPortfolioItem2(BuildContext context, String title,
      String description, String imageUrl, List<Map<String, dynamic>> links) {
    return PortfolioItem(
      title: title,
      description: description,
      imageUrl: imageUrl,
      links: links,
    );
  }

  List<Widget> _addPortfolioItems(BuildContext context) {
    List<Widget> portfolioItems = [];
    Widget portfolioItem1 = _buildPortfolioItem2(
        context,
        "Masstaxi",
        "This system simply explained is an audio adverting dissemination system that uses public transport vehicles already installed sound system to disseminate advertising for businesses. It was build using Flutter, React for Web and Firebase. I was mainly responsible for the apps built using flutter (mainly for android) and backend code using cloud function.  You can explore what the system is about using the links if you are interested as it was really an innovative project.",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          {
            'icon': FontAwesomeIcons.googleDrive,
            'url': 'https://linkedin.com/in/project'
          },
          {
            'icon': FontAwesomeIcons.youtube,
            'url': 'https://youtube.com/watch?v=project'
          },
        ]);
    Widget portfolioItem2 = _buildPortfolioItem2(
        context,
        "Non Stop Ethiopia",
        "This is a simple app idea I had when I was working with mini buses for our start up Masstaxi in which I observed taxi drivers had audio files with longer remix of different songs they called nonstop music which they shared manually amongst each other and I wanted to create a centralized music streaming app for them in which they could choose the nonstop music they wanted which is updated daily for newer choices which makes the process much simpler and give them new functionality. And since internet was getting cheaper I thought the project could be feasible but I didn’t move forward with it because I didn’t have the time but I implemented the basic version of it.",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          {
            'icon': FontAwesomeIcons.googleDrive,
            'url': 'https://linkedin.com/in/project'
          },
          {
            'icon': FontAwesomeIcons.youtube,
            'url': 'https://youtube.com/watch?v=project'
          },
        ]);
    Widget portfolioItem3 = _buildPortfolioItem2(
        context,
        "Karta Game",
        "It’s a simple game which I made for the ethiopian game market which was lacking in quantity and quality at the time. I relesed it to the play store when I was in University and was getting moderate success and growing until my PlayStore was shut down because of a fiverr scam. I made everything from scratch including the art using inkscape to the code using C# in unity. ",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          {
            'icon': FontAwesomeIcons.googlePlay,
            'url': 'https://linkedin.com/in/project'
          },
          {
            'icon': FontAwesomeIcons.youtube,
            'url': 'https://youtube.com/watch?v=project'
          },
        ]);
    Widget portfolioItem4 = _buildPortfolioItem2(
        context,
        "Ubuntu Management System",
        "It’s a management app that contains app and website both developed in flutter for the AI training agency I was working for which handled the employee and employer relationship which was being done manually. The main part of the project was handling and monitoring employee relationship and generating report for management.",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          // {
          //   'icon': FontAwesomeIcons.googleDrive,
          //   'url': 'https://linkedin.com/in/project'
          // },
        ]);

    Widget portfolioItem5 = _buildPortfolioItem2(
        context,
        "Mini Carpool Game",
        "I was tasked with creating a simple puzzle game designed for a competition. It was designed to spread awareness about carbon footprint which I was happy to help with. The core mechanics of the game was to utilize your fuel efficiently by carefully planning your path to your destinations. Unfortunately, the project was cut short before it can be fully implemented (especially graphic wise) and more interesting levels were added to it but the core gameplay was finished.",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          {
            'icon': FontAwesomeIcons.googleDrive,
            'url': 'https://linkedin.com/in/project'
          },
        ]);
    Widget portfolioItem6 = _buildPortfolioItem2(
        context,
        "Simple Math Game",
        "This is the first game I uploaded to the playstore. I wanted to make a simple relaxing math game with my own twist to it and a simple memory tester game mechanic which I enjoyed and seen in another game. You can see the rules for the game mode in the link I attached and the main goal for the project was to build something I liked as a hobby and improve on my coding skills.",
        "https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600",
        [
          {
            'icon': FontAwesomeIcons.github,
            'url': 'https://github.com/user/project'
          },
          {
            'icon': FontAwesomeIcons.youtube,
            'url': 'https://youtube.com/watch?v=project'
          },
        ]);
    portfolioItems.add(portfolioItem1);
    portfolioItems.add(portfolioItem2);
    portfolioItems.add(portfolioItem3);
    portfolioItems.add(portfolioItem4);
    portfolioItems.add(portfolioItem5);
    portfolioItems.add(portfolioItem6);
    return portfolioItems;
  }
}
