import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';

class BuildSkillsWidget extends StatefulWidget {
  const BuildSkillsWidget({super.key});

  @override
  State<BuildSkillsWidget> createState() => _BuildSkillsWidgetState();
}

class _BuildSkillsWidgetState extends State<BuildSkillsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Constants.skills.entries.map(
        (entry) {
          return TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 800),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset((1 - value) * 50, 0),
                    // يتحرك من اليمين لليسار
                    child: child,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        entry.key,
                        style: TextStyle(
                          fontWeight: MediaQuery.of(context).size.width > 1300
                              ? FontWeight.w500
                              : FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width > 1300
                              ? 20
                              : 14,
                          color: ColorSchemes.primaryWhite,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(seconds: 2),
                        tween: Tween(begin: 0.0, end: entry.value),
                        builder: (context, value, child) {
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.17,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width *
                                    0.17 *
                                    value,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorSchemes.primarySecondary,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
        },
      ).toList(),
    );
  }
}
