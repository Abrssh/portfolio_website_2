import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website_2/MVVM/View/Widgets/portfolio_items.dart';

class PortfolioSection extends StatelessWidget {
  final bool isTest;

  const PortfolioSection({super.key, this.isTest = false});

  @override
  Widget build(BuildContext context) {
    final List<Widget> portfolioItems = _addPortfolioItems(context);

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
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: portfolioItems[index]),
                    ),
                  );
                },
                itemCount: portfolioItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioItem2(BuildContext context, String title,
      String description, String imagePath, List<Map<String, dynamic>> links) {
    return PortfolioItem(
      title: title,
      description: description,
      imagePath: isTest ? '' : imagePath,
      links: links,
    );
  }

  List<Widget> _addPortfolioItems(BuildContext context) {
    if (isTest) {
      return [
        _buildPortfolioItem2(
          context,
          'Test Project',
          'Test Description',
          '',
          [
            {
              'icon': FontAwesomeIcons.github,
              'url': 'https://github.com/user/project'
            }
          ],
        )
      ];
    }

    List<Widget> portfolioItems = [];
    Widget portfolioItem1 = _buildPortfolioItem2(
        context,
        "Masstaxi",
        "This system simply explained is an audio adverting dissemination system that uses public transport vehicles already installed sound system to disseminate advertising for businesses. It was build using Flutter, React for Web and Firebase. I was mainly responsible for the apps built using flutter (mainly for android) and backend code using cloud function.  You can explore what the system is about using the links if you are interested as it was really an innovative project.",
        "images/masstaxi.PNG", [
      {
        'icon': FontAwesomeIcons.github,
        'url':
            'https://github.com/Abrssh/SampleWork/tree/master/Flutter%20Projects'
      },
      {
        'icon': FontAwesomeIcons.google,
        'url': 'https://masstaxi.web.app/#features24-4'
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'url':
            'https://www.youtube.com/playlist?list=PLnb4UAArJcGp_1urS78rMLAfZZbbn4NFW'
      },
    ]);
    Widget portfolioItem2 = _buildPortfolioItem2(
        context,
        "Non Stop Ethiopia",
        "This is a simple app idea I had when I was working with mini buses for our start up Masstaxi in which I observed taxi drivers had audio files with longer remix of different songs they called nonstop music which they shared manually amongst each other and I wanted to create a centralized music streaming app for them in which they could choose the nonstop music they wanted which is updated daily for newer choices which makes the process much simpler and give them new functionality.",
        "", [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/Abrssh/NonStop-Ethiopia'
      },
    ]);
    Widget portfolioItem3 = _buildPortfolioItem2(
        context,
        "Karta Game",
        "It's a simple game which I made for the ethiopian game market which was lacking in quantity and quality at the time. I relesed it to the play store when I was in University and was getting moderate success and growing until my PlayStore was shut down because of a fiverr scam. I made everything from scratch including the art using inkscape to the code using C# in unity.",
        "images/karta.png", [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/Abrssh/Karta-Game-Copy'
      },
      {
        'icon': FontAwesomeIcons.googlePlay,
        'url':
            'https://drive.google.com/file/d/1nGAB54mGfYKWOTVkHcHG_P72oTPNbJxE/view?usp=sharing'
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'url': 'https://www.youtube.com/watch?v=KQ7mCj97LdE'
      },
    ]);
    Widget portfolioItem4 = _buildPortfolioItem2(
        context,
        "Ubuntu Management System",
        "It's a management app that contains app and website both developed in flutter for the AI training agency I was working for which handled the employee and employer relationship which was being done manually. The main part of the project was handling and monitoring employee relationship and generating report for management.",
        "", [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/Abrssh/ubuntu_system'
      },
      {
        'icon': FontAwesomeIcons.google,
        'url': 'https://ubuntusystem-940be.firebaseapp.com'
      },
    ]);

    Widget portfolioItem5 = _buildPortfolioItem2(
        context,
        "Mini Carpool Game",
        "I was tasked with creating a simple puzzle game designed for a competition. It was designed to spread awareness about carbon footprint which I was happy to help with. The core mechanics of the game was to utilize your fuel efficiently by carefully planning your path to your destinations. Unfortunately, the project was cut short before it can be fully implemented (especially graphic wise) and more interesting levels were added to it but the core gameplay was finished.",
        "images/mini_carpool.jpg", [
      {
        'icon': FontAwesomeIcons.video,
        'url':
            'https://drive.google.com/file/d/1q7YggzkNT2vRXzYKXzyCxli_jGOiT1Bl/view?usp=sharing'
      },
      {
        'icon': FontAwesomeIcons.googleDrive,
        'url':
            'https://drive.google.com/file/d/1zJzSXl_Cy7QQxCwSDl8vYFPsbawgffOX/view?usp=drive_link'
      },
    ]);
    Widget portfolioItem6 = _buildPortfolioItem2(
        context,
        "Simple Math Game",
        "This is the first game I uploaded to the playstore. I wanted to make a simple relaxing math game with my own twist to it and a simple memory tester game mechanic which I enjoyed and seen in another game. You can see the rules for the game mode in the link I attached and the main goal for the project was to build something I liked as a hobby and improve on my coding skills.",
        "images/simple.png", [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/user/project'
      },
      {
        'icon': FontAwesomeIcons.youtube,
        'url': 'https://www.youtube.com/watch?v=tQAtNc5KuRc'
      },
    ]);
    portfolioItems.add(portfolioItem1);
    portfolioItems.add(portfolioItem2);
    portfolioItems.add(portfolioItem4);
    portfolioItems.add(portfolioItem3);
    portfolioItems.add(portfolioItem5);
    portfolioItems.add(portfolioItem6);
    return portfolioItems;
  }
}
