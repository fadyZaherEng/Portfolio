import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';

class IOSSwitchWithThumbImage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> toggleTheme;

  const IOSSwitchWithThumbImage({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  State<IOSSwitchWithThumbImage> createState() =>
      _IOSSwitchWithThumbImageState();
}

class _IOSSwitchWithThumbImageState extends State<IOSSwitchWithThumbImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: widget.isDarkMode ? 1.0 : 0.0,
    );
  }

  @override
  void didUpdateWidget(covariant IOSSwitchWithThumbImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animationController.animateTo(widget.isDarkMode ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).darkMode,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorSchemes.white,
              fontSize: 15,
              fontWeight: Constants.fontWeightMedium,
            ),
      ),
      trailing: GestureDetector(
        onTap: () {
          widget.toggleTheme(!widget.isDarkMode);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                color: widget.isDarkMode
                    ? ColorSchemes .primarySecondaryWhite
                    : ColorSchemes.primary,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  left: widget.isDarkMode
                      ? (_animationController.value * 20)
                      : 4 + (_animationController.value * 26),
                  child: Container(
                    width: 22,
                    height: 22,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      widget.isDarkMode ? ImagePaths.dark : ImagePaths.light,
                      fit: BoxFit.cover,
                      color:
                          widget.isDarkMode ? Colors.black : ColorSchemes.white,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
