import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Fades + slides its [child] up the first time it scrolls into view.
/// [delay] staggers items so a row/grid animates in sequence.
class Reveal extends StatefulWidget {
  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offsetY = 32,
  });

  final Widget child;
  final Duration delay;
  final double offsetY;

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  bool _shown = false;

  void _onVisibility(VisibilityInfo info) {
    if (_shown) return;
    if (info.visibleFraction > 0.12) {
      if (widget.delay == Duration.zero) {
        if (mounted) setState(() => _shown = true);
      } else {
        Future.delayed(widget.delay, () {
          if (mounted) setState(() => _shown = true);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('reveal_${identityHashCode(this)}'),
      onVisibilityChanged: _onVisibility,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOutCubic,
        offset: _shown ? Offset.zero : Offset(0, widget.offsetY / 100),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeOut,
          opacity: _shown ? 1 : 0,
          child: widget.child,
        ),
      ),
    );
  }
}
