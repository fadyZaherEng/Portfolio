import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:my_portfolio/src/core/utils/constants.dart';
import 'package:my_portfolio/src/di/data_layer_injector.dart';
import 'package:my_portfolio/src/domain/usecase/get_theme_use_case.dart';
import 'package:my_portfolio/src/presentation/screens/portfolio/widgets/build_logo_widget.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool isBack;
  final void Function()? onBackTap;
  final void Function() onLogoTap;

  const CustomAppBarWidget({
    super.key,
    this.isBack = false,
    this.onBackTap,
    required this.onLogoTap,
  });

  @override
  State<CustomAppBarWidget> createState() => _State();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _State extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorSchemes.appBarColor,
      elevation: 5,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: widget.onLogoTap,
          child: BuildLogoWidget(
            width: 50,
            height: 50,
            imagePath: ImagePaths.newLogo2,
            color: GetThemeUseCase(injector())() == Constants.dark
                ? ColorSchemes.secondary
                : ColorSchemes.iconBackGround,
          ),
        ),
      ),
      actions: widget.isBack
          ? [
              IconButton(
                icon: Container(
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  child: SvgPicture.asset(
                    ImagePaths.backArrow,
                    matchTextDirection: true,
                    width: 22,
                    height: 22,
                    color: GetThemeUseCase(injector())() == Constants.dark
                        ? ColorSchemes.secondary
                        : ColorSchemes.iconBackGround,
                  ),
                ),
                onPressed: widget.onBackTap,
              ),
            ]
          : [],
    );
  }
}
