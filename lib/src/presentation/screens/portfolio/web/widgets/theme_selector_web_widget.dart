import 'package:flutter/material.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';

/// Widget for selecting Light, Dark, and Midnight themes.
class ThemeSelectorWebWidget extends StatelessWidget {
  final String currentTheme;
  final void Function(String) changeTheme;

  const ThemeSelectorWebWidget({
    Key? key,
    required this.currentTheme,
    required this.changeTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String label, String value) {
      final bool selected = currentTheme == value;
      return InkWell(
        onTap: () => changeTheme(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? ColorSchemes.primarySecondaryWhite.withOpacity(0.25)
                : Colors.white.withOpacity(0.08),
            border: Border.all(
              color: selected
                  ? ColorSchemes.primarySecondaryWhite
                  : Colors.white.withOpacity(0.3),
              width: selected ? 2.0 : 1.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected ? ColorSchemes.white : Colors.white70,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 14,
                ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildOption('Light', Constants.light),
        buildOption('Dark', Constants.dark),
        buildOption('Midnight', Constants.newDark),
      ],
    );
  }
}
