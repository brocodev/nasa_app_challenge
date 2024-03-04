import 'dart:ui';

import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: const Drawer(
          backgroundColor: Color(0x880f0f0f),
          elevation: 0,
        ),
      ),
    );
  }
}
