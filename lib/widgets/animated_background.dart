import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A fixed, gently-drifting gradient backdrop: soft colored "blobs" over a
/// faint dotted grid. Sits behind the (transparent) scrolling content.
class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 24))
      ..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final t = _c.value * 2 * math.pi;
          return CustomPaint(
            painter: _BackdropPainter(t),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _BackdropPainter extends CustomPainter {
  _BackdropPainter(this.t);
  final double t;

  void _blob(Canvas canvas, Offset center, double radius, Color color) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [color.withValues(alpha: 0.45), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Base fill.
    canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.background);

    // Faint dotted grid for texture.
    final dot = Paint()..color = Colors.white.withValues(alpha: 0.025);
    const gap = 38.0;
    for (double y = 0; y < size.height; y += gap) {
      for (double x = 0; x < size.width; x += gap) {
        canvas.drawCircle(Offset(x, y), 1.1, dot);
      }
    }

    // Drifting colored blobs.
    final w = size.width, h = size.height;
    _blob(
      canvas,
      Offset(w * 0.18 + math.sin(t) * 40, h * 0.12 + math.cos(t) * 30),
      math.max(w, h) * 0.34,
      AppColors.violet,
    );
    _blob(
      canvas,
      Offset(w * 0.85 + math.cos(t * 0.8) * 50, h * 0.30 + math.sin(t * 0.8) * 40),
      math.max(w, h) * 0.30,
      AppColors.accent,
    );
    _blob(
      canvas,
      Offset(w * 0.55 + math.sin(t * 1.2) * 60, h * 0.85 + math.cos(t) * 30),
      math.max(w, h) * 0.32,
      AppColors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant _BackdropPainter old) => old.t != t;
}
