import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_common/ui_common.dart';

class PlanetsView extends StatelessWidget {
  const PlanetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: 20.edgeInsetsA,
      children: [
        Center(
          child: Text(
            'Solar system',
            style: context.titleMedium,
          ),
        ),
        4.verticalSpace,
        // PageView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemBuilder: (context, index) {
        //     return Card();
        //   },
        // ),
      ],
    );
  }
}
