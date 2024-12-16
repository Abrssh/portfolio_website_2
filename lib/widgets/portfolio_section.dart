import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website_2/screens/UI/portfolio_items.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  PortfolioSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  bool runOnce = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> portfolioItems = [];
    if (!runOnce) {
      for (int i = 0; i < 5; i++) {
        portfolioItems.add(
          _buildPortfolioItem2(
            context,
            'Project Title',
            'It’s a simple game which I made for the ethiopian game market which was lacking in quantity and quality at the time. I relesed it to the play store when I was in University and was getting moderate success and growing until my PlayStore was shut down because of a fiverr scam. I made everything from scratch including the art using inkscape to the code using C# in unity. ',
            'https://images.pexels.com/photos/6867603/pexels-photo-6867603.jpeg?auto=compress&cs=tinysrgb&w=600',
            [
              {
                'icon': FontAwesomeIcons.github,
                'url': 'https://github.com/user/project'
              },
              {
                'icon': FontAwesomeIcons.linkedin,
                'url': 'https://linkedin.com/in/project'
              },
              {
                'icon': FontAwesomeIcons.youtube,
                'url': 'https://youtube.com/watch?v=project'
              },
            ],
          ),
        );
      }
      runOnce = true;
    }

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          // Wrap(
          //   spacing: 16,
          //   runSpacing: 16,
          //   children: [
          //     _buildPortfolioItem(
          //       context,
          //       'Project 1',
          //       'A Flutter mobile app for task management',
          //       'https://youtube.com/watch?v=your-video-1',
          //       FontAwesomeIcons.youtube,
          //     ),
          //     _buildPortfolioItem(
          //       context,
          //       'Project 2',
          //       'React-based e-commerce platform',
          //       'https://github.com/yourusername/project2',
          //       FontAwesomeIcons.github,
          //     ),
          //     _buildPortfolioItem(
          //       context,
          //       'Project 3',
          //       'Node.js backend API',
          //       'https://stackoverflow.com/questions/tagged/your-tag',
          //       FontAwesomeIcons.stackOverflow,
          //     ),

          //   ],
          // ),
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
                shrinkWrap: true,
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
}
