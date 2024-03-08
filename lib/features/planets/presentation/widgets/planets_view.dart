import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class PlanetsView extends StatelessWidget {
  const PlanetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: PageView()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: 20.borderRadiusT,
            ),
          ),
        ),
      ],
    );
  }
}
