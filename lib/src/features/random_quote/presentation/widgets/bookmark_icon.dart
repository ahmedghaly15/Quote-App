import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkIcon extends StatefulWidget {
  const BookmarkIcon({
    super.key,
  });

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    initOpacityAnimation();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isBookmarked) {
          setState(() {
            _isBookmarked = false;
            _animationController.forward();
          });
        } else {
          setState(() {
            _isBookmarked = true;
            _animationController.reverse();
          });
        }
      },
      child: AnimatedOpacity(
        opacity: _opacityAnimation.value,
        duration: const Duration(milliseconds: 700),
        child: Transform.scale(
          scale: !_isBookmarked ? 1.0 : 1.2,
          child: Icon(
            _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.white,
            size: 28.w,
          ),
        ),
      ),
    );
  }

  void initOpacityAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(
      end: 1.0,
      begin: 0.5,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    ));
  }
}
