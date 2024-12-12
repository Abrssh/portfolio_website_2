import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildPortfolioItem(
                context,
                'Project 1',
                'A Flutter mobile app for task management',
                'https://youtube.com/watch?v=your-video-1',
                FontAwesomeIcons.youtube,
              ),
              _buildPortfolioItem(
                context,
                'Project 2',
                'React-based e-commerce platform',
                'https://github.com/yourusername/project2',
                FontAwesomeIcons.github,
              ),
              _buildPortfolioItem(
                context,
                'Project 3',
                'Node.js backend API',
                'https://stackoverflow.com/questions/tagged/your-tag',
                FontAwesomeIcons.stackOverflow,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioItem(BuildContext context, String title, String description, String url, IconData icon) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => _launchUrl(url),
            icon: FaIcon(icon),
            label: const Text('View Project'),
          ),
        ],
      ),
    );
  }
}