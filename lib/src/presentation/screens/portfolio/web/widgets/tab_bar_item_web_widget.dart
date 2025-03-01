import 'package:flutter/material.dart';

class TabBarItemWebWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Color textColor;
  final double fontSize;
  final Color indicatorColor;

  const TabBarItemWebWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.textColor,
    required this.fontSize,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor, fontSize: fontSize),
            ),
            const SizedBox(height: 5),
            if (isSelected)
              Container(
                height: 3,
                width: 90,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
