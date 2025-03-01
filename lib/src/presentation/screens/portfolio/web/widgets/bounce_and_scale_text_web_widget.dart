import 'package:flutter/material.dart';

class BouncingAndScalingTextWebWidget extends StatefulWidget {
  final String title;
  final TextAlign? textAlign;
  final TextStyle? style;

  const BouncingAndScalingTextWebWidget({
    super.key,
    required this.title,
    this.style,
    this.textAlign,
  });

  @override
  _BouncingAndScalingTextWebWidgetState createState() =>
      _BouncingAndScalingTextWebWidgetState();
}

class _BouncingAndScalingTextWebWidgetState
    extends State<BouncingAndScalingTextWebWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // مدة الحركة
      vsync: this,
    )..repeat(reverse: true); // تكرار ذهابًا وإيابًا

    _scaleAnimation = Tween<double>(
      begin: 1.0, // الحجم الطبيعي
      end: 1.2, // تكبير النص بنسبة 20%
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // الموضع الأصلي
      end: const Offset(0, 0.1), // يتحرك قليلاً لأسفل
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Text(
          widget.title,
          textAlign: widget.textAlign ?? TextAlign.center,
          style: widget.style ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.7,
                    letterSpacing: -0.1,
                  ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
