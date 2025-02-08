 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class WebAnimatedPartnerItem extends StatelessWidget {
  final String image;

  const WebAnimatedPartnerItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                 child: _buildImage(context),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImage(context) {
    return _isSvg(image)
        ? SvgPicture.network(
            image,
             key: ValueKey<String>(image),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            placeholderBuilder: (context) =>Image.asset(
              ImagePaths.imagePlaceHolder,
              fit: BoxFit.scaleDown,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          )
        : Image.network(
            image,
            key: ValueKey<String>(image),
            fit: BoxFit.scaleDown,
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              ImagePaths.imagePlaceHolder,
              fit: BoxFit.scaleDown,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          );
  }

  bool _isSvg(String image) => image.contains(".svg");
}
