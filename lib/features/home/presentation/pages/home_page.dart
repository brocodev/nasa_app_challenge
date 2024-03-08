import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/apods_home_view.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_drawer.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_tab_bar_navigation.dart';
import 'package:nasa_app_challenge/features/planets/presentation/widgets/planets_view.dart';
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
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: const _HomeAppBar(),
      body: _EntryAnimationWrapper(
        curve: const Interval(0.2, .8, curve: Curves.fastOutSlowIn),
        child: TabBarView(
          controller: controller,
          children: const [
            ApodsHomeView(),
            PlanetsView(),
            Center(
              child: Text('View 3'),
            ),
            Center(
              child: Text('View 4'),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: _EntryAnimationWrapper(
        curve: const Interval(0.4, 1, curve: Curves.fastOutSlowIn),
        child: HomeTabBarNavigation(controller: controller),
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSize {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return _EntryAnimationWrapper(
      curve: const Interval(0, .6, curve: Curves.fastOutSlowIn),
      child: AppBar(
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
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.sp);
}

class _EntryAnimationWrapper extends StatelessWidget {
  const _EntryAnimationWrapper({
    required this.child,
    required this.curve,
  });

  final Widget child;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1300),
      tween: Tween(begin: 0, end: 1),
      curve: curve,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
