import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/src/core/utils/openLink.dart';

class FlutterPackagesMobileWidget extends StatelessWidget {
  final bool isDarkMode;
  const FlutterPackagesMobileWidget({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = isDarkMode 
        ? ColorSchemes.primary.withOpacity(0.15) 
        : ColorSchemes.primary.withOpacity(0.05);
    final Color borderColor = isDarkMode 
        ? ColorSchemes.primary.withOpacity(0.3) 
        : ColorSchemes.primary.withOpacity(0.1);

    final Color titleColor = isDarkMode 
        ? ColorSchemes.secondary 
        : ColorSchemes.primary;
    final Color subtitleColor = isDarkMode 
        ? Colors.white.withOpacity(0.7) 
        : ColorSchemes.primary.withOpacity(0.6);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Flutter Packages",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorSchemes.iconDarkWhite,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: ColorSchemes.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 30),
          _buildPackageCard(
            title: "fzTrimmer",
            subtitle: "Video Trimming Utility",
            description: "A highly flexible Flutter package for video trimming. Provides a sleek UI for selecting video segments with precision.",
            icon: Icons.video_library_rounded,
            url: "https://pub.dev/packages/fz_trimmer",
            cardColor: cardColor,
            borderColor: borderColor,
            titleColor: titleColor,
            subtitleColor: subtitleColor,
          ),
          const SizedBox(height: 16),
          _buildPackageCard(
            title: "fzReactionsChat",
            subtitle: "Chat Reactions Interface",
            description: "Visually appealing chat reaction system. Offers customizable emoji reactions with smooth animations.",
            icon: Icons.add_reaction_rounded,
            url: "https://pub.dev/packages/fz_reactions_chat",
            cardColor: cardColor,
            borderColor: borderColor,
            titleColor: titleColor,
            subtitleColor: subtitleColor,
          ),
          const SizedBox(height: 16),
          _buildPackageCard(
            title: "fz_google_oauth2",
            subtitle: "Google OAuth2 Handler",
            description: "Full control over Google OAuth2 login without Web View. Gracefully handles token expiration.",
            icon: FontAwesomeIcons.google,
            url: "https://pub.dev/packages/fz_google_oauth2",
            cardColor: cardColor,
            borderColor: borderColor,
            titleColor: titleColor,
            subtitleColor: subtitleColor,
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required String url,
    required Color cardColor,
    required Color borderColor,
    required Color titleColor,
    required Color subtitleColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: titleColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: ColorSchemes.white.withOpacity(0.9),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => openLink(url),
            child: Row(
              children: [
                Text(
                  "View on pub.dev",
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_forward_rounded, 
                  color: titleColor, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
