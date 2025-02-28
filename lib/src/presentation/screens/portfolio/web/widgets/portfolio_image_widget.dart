import 'package:flutter/material.dart';
import 'package:my_portfolio/src/config/theme/color_schemes.dart';
import 'package:my_portfolio/src/core/resources/image_paths.dart';

class PortfolioImageWidget extends StatefulWidget {
  const PortfolioImageWidget({Key? key}) : super(key: key);

  @override
  _PortfolioImageWidgetState createState() => _PortfolioImageWidgetState();
}

class _PortfolioImageWidgetState extends State<PortfolioImageWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: MediaQuery.sizeOf(context).width > 850 ? 250 : 200,
                width: MediaQuery.sizeOf(context).width > 850 ? 250 : 200,
                alignment: AlignmentDirectional.topEnd,
                child: _buildImageWidget(context),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageWidget(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 15,
            child: CustomPaint(
              painter: FullCirclePainter(ColorSchemes.primarySecondary),
              size: const Size(150, 150),
            ),
          ),
          // Positioned(
          //   bottom: 2,
          //   child: CustomPaint(
          //     painter: FullCirclePainter(
          //         ColorSchemes.primarySecondary.withOpacity(0.4)),
          //     size: const Size(150, 150),
          //   ),
          // ),
          const Positioned(
            bottom: 2,
            child: PulsingCircleWidget(),
          ),
          ClipOval(
            child: Image.asset(
              ImagePaths.fady, // استبدلها بصورتك
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // الدائرة السفلية (تكون خلف الصورة)
        ],
      ),
    );
  }
}

class PulsingCircleWidget extends StatefulWidget {
  const PulsingCircleWidget({Key? key}) : super(key: key);

  @override
  _PulsingCircleWidgetState createState() => _PulsingCircleWidgetState();
}

class _PulsingCircleWidgetState extends State<PulsingCircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // ✅ جعل الأنيميشن ينبض ذهابًا وإيابًا

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: CustomPaint(
            painter: FullCirclePainter(
              ColorSchemes.primarySecondary.withOpacity(0.4),
            ),
            size: const Size(150, 150),
          ),
        );
      },
    );
  }
}

// رسم الدائرة الكاملة
class FullCirclePainter extends CustomPainter {
  final Color color;

  FullCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15; // زيادة سمك الدائرة

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 90, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
