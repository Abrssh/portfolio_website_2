import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            'Find Me',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildContactButton(
                'Upwork',
                'https://www.upwork.com/freelancers/~013f6fcbd4876855ac',
                FontAwesomeIcons.upwork,
                const Color(0xFF6FDA44),
              ),
              _buildContactButton(
                'Fiverr',
                'https://www.fiverr.com/your-profile',
                FontAwesomeIcons.fire,
                const Color(0xFF1DBF73),
              ),
              _buildContactButton(
                'Email',
                'mailto:abrsshwork@gmail.com',
                Icons.email,
                Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  Widget _buildContactButton(
      String title, String url, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () => _launchUrl(url),
      icon: Icon(icon, color: color),
      label: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 2,
      ),
    );
  }
}
