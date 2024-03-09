import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';

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
          child: Hero(
            tag: 'search-text-field',
            child: Material(
              type: MaterialType.transparency,
              child: TextField(
                readOnly: true,
                onTap: () => context.pushNamed(AppRoutes.search.name),
                decoration: const InputDecoration(
                  hintText: 'Explore the space',
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
