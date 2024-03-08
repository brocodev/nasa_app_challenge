import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_common/ui_common.dart';

class HomeTabBarNavigation extends StatelessWidget {
  const HomeTabBarNavigation({
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.scaffoldBackgroundColor.withOpacity(0),
            context.scaffoldBackgroundColor.withOpacity(.6),
            context.scaffoldBackgroundColor,
          ],
        ),
      ),
      child: Padding(
        padding: 20.edgeInsetsT,
        child: SizedBox(
          height: kToolbarHeight.sp,
          child: AnimatedBuilder(
            animation: controller,
            builder: (__, _) {
              final index = controller.index;
              final icons = [
                Icons.home_rounded,
                Icons.public,
                Icons.ondemand_video_rounded,
                Icons.podcasts,
              ];
              return TabBar(
                controller: controller,
                indicator: _LightIndicator(),
                tabs: [
                  for (final icon in icons) ...[
                    Tab(
                      icon: Icon(
                        icon,
                        shadows: [
                          if (icons.indexOf(icon) == index)
                            const Shadow(
                              color: Colors.white,
                              blurRadius: 40,
                            ),
                        ],
                      ),
                    ),
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LightIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LinePainter();
  }
}

class _LinePainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final dx = offset.dx;
    final w = configuration.size!.width;
    const color = Colors.white;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final path = Path()
      ..moveTo(dx, -10)
      ..lineTo(dx + w, -10)
      ..quadraticBezierTo(dx + w + 10, -4, dx + w + 5, 2)
      ..lineTo(dx + w + 5, 2)
      ..lineTo(dx, 2)
      ..quadraticBezierTo(dx - 10, -4, dx - 5, -10);
    canvas
      ..drawShadow(path, color, 6, true)
      ..drawLine(Offset(dx, 1.5), Offset(dx + w, 1.5), paint);
  }
}
