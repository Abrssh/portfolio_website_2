import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<Map<String, dynamic>> links; // List of maps with 'icon' and 'url'

  const PortfolioItem({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.links,
  });

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450, // Increased width
      height: 650,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24), // Increased padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Increased border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 400, // Image width
              height: 200, // Image height
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(height: 16),
          // AnimatedTextKit(
          //   animatedTexts: [
          //     TyperAnimatedText(description,
          //         textStyle: Theme.of(context).textTheme.bodyLarge),
          //   ],
          //   isRepeatingAnimation: false,
          // ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fadeIn(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 600),
              ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: links.map((link) {
              return IconLink(
                icon: Icon(link['icon']),
                url: link['url'],
                onPressed: () => _launchUrl(link['url']),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class IconLink extends StatelessWidget {
  final Icon icon;
  final String url;
  final VoidCallback onPressed;

  const IconLink({
    super.key,
    required this.icon,
    required this.url,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text('View ${url.split('/').last}'), // Dynamic label based on URL
    );
  }
}
