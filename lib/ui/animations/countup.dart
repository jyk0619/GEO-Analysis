import 'package:flutter/material.dart';

class CountUpText extends StatefulWidget {
  final double end;
  final double start;
  final int fractionDigits;      // 소수점 자릿수
  final Duration duration;
  final TextStyle? style;
  final String? suffix;

  const CountUpText({
    Key? key,
    required this.end,
    this.start = 0,
    this.fractionDigits = 1,     // 기본 값: 소수점 1자리
    this.duration = const Duration(seconds: 1),
    this.style,
    this.suffix,
  }) : super(key: key);

  @override
  State<CountUpText> createState() => _CountUpTextState();
}

class _CountUpTextState extends State<CountUpText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(begin: widget.start, end: widget.end).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CountUpText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.end != widget.end || oldWidget.start != widget.start) {
      _animation = Tween<double>(begin: widget.start, end: widget.end).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Text(
        '${_animation.value.toStringAsFixed(widget.fractionDigits)}${widget.suffix ?? ""}',
        style: widget.style ?? DefaultTextStyle.of(context).style,
      ),
    );
  }
}
