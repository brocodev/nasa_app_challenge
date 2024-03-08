import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/apods_home_view.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_drawer.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_tab_bar_navigation.dart';
import 'package:ui_common/ui_common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.fastOutSlowIn,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Scaffold(
        drawer: const HomeDrawer(),
        appBar: AppBar(
          title: Center(
            child: Assets.images.nasaSymbol.image(
              height: 24.h,
              width: 120.w,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: TabBarView(
          controller: controller,
          children: [
            const ApodsHomeView(),
            const Center(
              child: Text('View 2'),
            ),
            const Center(
              child: Text('View 3'),
            ),
            const Center(
              child: Text('View 4'),
            ),
          ],
        ),
        extendBody: true,
        bottomNavigationBar: HomeTabBarNavigation(controller: controller),
      ),
    );
  }
}
