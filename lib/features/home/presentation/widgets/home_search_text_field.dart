import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchTextField extends StatelessWidget {
  const HomeSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      toolbarHeight: (kToolbarHeight + 12).sp,
      actions: [
        Expanded(
          child: TextField(
            readOnly: true,
            onTap: () {},
            decoration: const InputDecoration(
              hintText: 'Explore the space',
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
