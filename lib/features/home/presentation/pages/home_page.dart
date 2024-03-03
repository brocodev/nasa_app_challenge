import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/apod_image_card.dart';
import 'package:ui_common/ui_common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Assets.images.nasaSymbol.image(
            height: 24.h,
          ),
        ),
      ),
      body: Padding(
        padding: 16.edgeInsetsA,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Explore the space',
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white54,
                  ),
                  contentPadding: 13.edgeInsetsA,
                  border: OutlineInputBorder(
                    borderRadius: 12.borderRadiusA,
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: 12.borderRadiusA,
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                ),
              ),
            ),
            20.verticalSpace.toSliver,
            const SliverToBoxAdapter(
              child: Text('APOD (Astronomic Photo of the Day)'),
            ),
            12.verticalSpace.toSliver,
            const SliverToBoxAdapter(
              child: APODImageCard(),
            )
          ],
        ),
      ),
    );
  }
}
