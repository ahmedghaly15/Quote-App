import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrameCircle extends StatelessWidget {
  const FrameCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.w,
      width: 5.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
