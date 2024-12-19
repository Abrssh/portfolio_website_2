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
    Size screenSize = MediaQuery.of(context).size;
    double itemWidth =
        screenSize.width * 0.35; // Adjust width to 60% of screen width
    double itemHeight =
        screenSize.height * 0.8; // Adjust height to 70% of screen height
    double imageWidth =
        itemWidth * 0.9; // Adjust image width to 90% of item width
    double imageHeight =
        itemHeight * 0.4; // Adjust image height to 30% of item height

    return Container(
      width: itemWidth,
      height: itemHeight,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double titleFontSize;
          double descriptionFontSize;
          double iconSize;

          if (MediaQuery.of(context).size.width > 600) {
            // Web
            titleFontSize = constraints.maxWidth * 0.07;
            descriptionFontSize =
                (constraints.maxWidth + constraints.maxHeight / 2) * 0.018;
            iconSize = constraints.maxWidth * 0.06;
          } else {
            // Mobile
            titleFontSize = constraints.maxWidth * 0.1;
            descriptionFontSize = titleFontSize * 0.5;
            iconSize = constraints.maxWidth * 0.08;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                // style: Theme.of(context).textTheme.titleLarge,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                description,
                // style: Theme.of(context).textTheme.bodyLarge,
                style: TextStyle(
                  fontSize: descriptionFontSize,
                  color: Colors.black,
                ),
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
                    icon: Icon(
                      link['icon'],
                      size: iconSize,
                    ),
                    url: link['url'],
                    onPressed: () => _launchUrl(link['url']),
                  );
                }).toList(),
              ),
            ],
          );
        },
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
      label: Text(
        'View ${url.split('/').last}',
        style: Theme.of(context).textTheme.bodyMedium,
      ), // Dynamic label based on URL
    );
  }
}
