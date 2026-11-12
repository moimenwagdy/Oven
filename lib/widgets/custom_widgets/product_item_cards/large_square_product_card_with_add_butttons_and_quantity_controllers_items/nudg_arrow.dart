import 'package:flutter/material.dart';

class NudgeArrow extends StatefulWidget {
  const NudgeArrow({super.key, required this.icon, this.distance = 6});

  final IconData icon;

  /// Horizontal travel in px. Positive = moves right, negative = moves left.
  final double distance;

  @override
  State<NudgeArrow> createState() => _NudgeArrowState();
}

class _NudgeArrowState extends State<NudgeArrow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  late final Animation<double> _dx = Tween<double>(
    begin: 0,
    end: widget.distance,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dx,
      builder: (context, child) =>
          Transform.translate(offset: Offset(_dx.value, 0), child: child),
      child: Icon(
        widget.icon,
        size: 40,
        color: Theme.of(context).colorScheme.primary.withValues(alpha: .7),
      ),
    );
  }
}
