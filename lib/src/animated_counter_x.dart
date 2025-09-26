import 'package:flutter/material.dart';

/// A widget that animates a number (int or double) from [start] to [end] value.
///
/// Supports increment (count up) and decrement (count down) mode.
/// Provides an [onComplete] callback when the animation finishes.
/// Optional [prefix] and [suffix] can be added to the displayed value.
class AnimatedCounterX extends StatefulWidget {
  /// Start value of the counter
  final num start;

  /// End value of the counter
  final num end;

  /// Animation duration
  final Duration duration;

  /// Optional text style
  final TextStyle? style;

  /// Decimal places for double values
  final int decimalPlaces;

  /// If true, counts up; if false, counts down
  final bool increment;

  /// Callback executed when the animation completes
  final VoidCallback? onComplete;

  /// Optional text before the number (e.g., "$")
  final String? prefix;

  /// Optional text after the number (e.g., "%")
  final String? suffix;

  const AnimatedCounterX({
    Key? key,
    this.start = 0,
    required this.end,
    this.duration = const Duration(seconds: 2),
    this.style,
    this.decimalPlaces = 0,
    this.increment = true,
    this.onComplete,
    this.prefix,
    this.suffix,
  }) : super(key: key);

  @override
  State<AnimatedCounterX> createState() => _AnimatedCounterXState();
}

class _AnimatedCounterXState extends State<AnimatedCounterX>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<num> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animateCounter();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.onComplete != null) {
        widget.onComplete!();
      }
    });
  }

  void _animateCounter() {
    _animation = Tween<num>(
      begin: widget.start,
      end: widget.end,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller
      ..reset()
      ..forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedCounterX oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.start != widget.start || oldWidget.end != widget.end) {
      _animateCounter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        num value = widget.increment
            ? _animation.value
            : widget.start - (_animation.value - widget.start);

        String displayValue;
        if (widget.end is int && widget.start is int) {
          displayValue = value.toInt().toString();
        } else {
          displayValue = value.toStringAsFixed(widget.decimalPlaces);
        }

        if (widget.prefix != null) {
          displayValue = widget.prefix! + displayValue;
        }
        if (widget.suffix != null) {
          displayValue = displayValue + widget.suffix!;
        }

        return Text(
          displayValue,
          style: widget.style,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
