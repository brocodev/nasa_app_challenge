import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Drawer(
          backgroundColor: context.scaffoldBackgroundColor.withOpacity(.6),
          elevation: 0,
          child: SafeArea(
            minimum: 20.edgeInsetsH,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Assets.images.nasaGlobe.image(height: kToolbarHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
