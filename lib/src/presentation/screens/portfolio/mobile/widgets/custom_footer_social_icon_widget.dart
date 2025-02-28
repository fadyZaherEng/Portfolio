import 'package:flutter/material.dart';

class CustomFooterSocialIconWidget extends StatefulWidget {
  final Widget social;

  const CustomFooterSocialIconWidget({
    Key? key,
    required this.social,
  }) : super(key: key);

  @override
  _CustomFooterSocialIconWidgetState createState() =>
      _CustomFooterSocialIconWidgetState();
}

class _CustomFooterSocialIconWidgetState
    extends State<CustomFooterSocialIconWidget> {
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
