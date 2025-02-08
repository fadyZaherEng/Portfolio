import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';
import 'package:skeletons/skeletons.dart';

class GeneralSliderWidget extends StatefulWidget {
  final List<Attachment> attachments;
  final double height;
  final Function(Attachment, int)? onTap;
  final bool isViolation;

  const GeneralSliderWidget({
    Key? key,
    required this.attachments,
    this.onTap,
    this.height = 180,
    this.isViolation = false,
  }) : super(key: key);

  @override
  State<GeneralSliderWidget> createState() => _GeneralSliderWidgetState();
}

class Attachment {
  String pathUrl;
  String attachment;

  Attachment({required this.pathUrl,required this.attachment});
}

class _GeneralSliderWidgetState extends State<GeneralSliderWidget> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          clipBehavior: Clip.none,
          height: widget.height,
          width: double.infinity,
          child: CarouselSlider(
            items: widget.attachments.isEmpty
                ? [_buildPlaceHolderImage()]
                : widget.attachments.asMap().entries.map((logo) {
                    return _sliderImage(logo.value, logo.key);
                  }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              scrollPhysics: const BouncingScrollPhysics(),
              enableInfiniteScroll: false,
              disableCenter: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.attachments.asMap().entries.map((entry) {
              return _sliderIndicator(entry);
            }).toList())
      ],
    );
  }

  Widget _sliderImage(Attachment attachment, int index) {
    return InkWell(
      onTap: () => widget.onTap!(attachment, index),
      child: _childIsNotEmpty(attachment, index)
          ?   Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      topEnd: Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      topEnd: Radius.circular(12),
                    ),
                    child: Image.network(
                      widget.isViolation ?attachment.pathUrl:    attachment.attachment,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceHolderImage(
                            attachment: widget.isViolation ?attachment.pathUrl: attachment.attachment);
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: SkeletonLine(
                              style: SkeletonLineStyle(
                            width: double.infinity,
                            height: 180,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(12),
                              topEnd: Radius.circular(12),
                            ),
                          )),
                        );
                      },
                    ),
                  ),
                )
          : _buildPlaceHolderImage(),
    );
  }

  Widget _sliderIndicator(MapEntry<int, Attachment> entry) {
    return InkWell(
      onTap: () {
        _controller.animateToPage(entry.key);
      },
      child: Container(
        height: 8,
        width: 8,
        margin: const EdgeInsetsDirectional.only(bottom: 16, start: 4, end: 4),
        decoration: BoxDecoration(
          color: _currentIndex == entry.key
              ? ColorSchemes.primary
              : ColorSchemes.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildPlaceHolderImage({String? attachment}) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
        child: Image.asset(
          ImagePaths.imagePlaceHolder,
          fit: BoxFit.cover,
          height: 180,
        ),
      ),
    );
  }

 bool _childIsNotEmpty(Attachment attachment, int index) {
    if(widget.isViolation) {
      return attachment.pathUrl.isNotEmpty;
    }else {
      return widget.attachments.isNotEmpty;
    }
  }
}
