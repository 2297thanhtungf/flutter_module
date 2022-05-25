import 'package:flutter/material.dart';

class BackgroundBarScroll extends StatefulWidget {
  final ScrollController scrollController;
  final double heightTrigger;
  final Color colorBegin;
  final Color colorEnd;

  const BackgroundBarScroll(
      {Key? key,
      required this.scrollController,
      this.heightTrigger = 150,
      this.colorBegin = Colors.transparent,
      this.colorEnd = const Color(0xff327DBF)})
      : super(key: key);

  @override
  _BackgroundBarScrollState createState() => _BackgroundBarScrollState();
}

class _BackgroundBarScrollState extends State<BackgroundBarScroll>
    with TickerProviderStateMixin {
  late Animation<Color?> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _animation = ColorTween(begin: widget.colorBegin, end: widget.colorEnd)
        .animate(_animationController);
    widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    _animationController.animateTo(
        widget.scrollController.position.pixels / widget.heightTrigger);
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).padding.top,
          color: _animation.value,
        );
      },
    );
  }
}
