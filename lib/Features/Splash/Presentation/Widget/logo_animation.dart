import 'package:flutter/material.dart';

class LogoBookAnimated extends StatefulWidget {
  const LogoBookAnimated({super.key, required this.size});
  final double size;

  @override
  State<LogoBookAnimated> createState() => _LogoBookAnimatedState();
}

class _LogoBookAnimatedState extends State<LogoBookAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotationAnimation = Tween<double>(
      begin: -0.2,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
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
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Icon(
              Icons.menu_book_rounded, // شكل كتاب
              size: widget.size,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
