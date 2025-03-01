import 'package:flutter/material.dart';

class CustomFooterSocialIconWebWidget extends StatefulWidget {
  final Widget social;

  const CustomFooterSocialIconWebWidget({
    Key? key,
    required this.social,
  }) : super(key: key);

  @override
  _CustomFooterSocialIconWebWidgetState createState() =>
      _CustomFooterSocialIconWebWidgetState();
}

class _CustomFooterSocialIconWebWidgetState
    extends State<CustomFooterSocialIconWebWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) // Proper scaling
            : Matrix4.identity(),
        child: widget.social,
      ),
    );
  }
}
