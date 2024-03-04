import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/apod_image_card.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_drawer.dart';
import 'package:nasa_app_challenge/features/home/presentation/widgets/home_search_text_field.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
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
      body: Padding(
        padding: 16.edgeInsetsA.copyWith(bottom: 0),
        child: const _HomeScrollBody(),
      ),
    );
  }
}

class _HomeScrollBody extends StatefulWidget {
  const _HomeScrollBody();

  @override
  State<_HomeScrollBody> createState() => _HomeScrollBodyState();
}

class _HomeScrollBodyState extends State<_HomeScrollBody> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.offset == _controller.position.maxScrollExtent) {
      context.read<APODsBloc>().add(const APODsEvent.fetchAPODs());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<APODsBloc, APODsState>(
      builder: (_, state) {
        final apods = state.apods;
        final isLoading = state.isLoading;
        return RefreshIndicator(
          onRefresh: () async => context
              .read<APODsBloc>()
              .add(const APODsEvent.fetchAPODs(refresh: true)),
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              const HomeSearchTextField(),
              12.verticalSpace.toSliver,
              SliverToBoxAdapter(
                child: Text(context.l10n.apodAstronomyPictureOfTheDay),
              ),
              12.verticalSpace.toSliver,
              SliverToBoxAdapter(
                child: apods.isEmpty
                    ? const ShimmerCard(aspectRatio: 1.8)
                    : APODImageCard(
                        onTap: () =>
                            context.pushNamed(AppRoutes.apod.name, extra: 0),
                        apod: apods.first,
                        aspectRatio: 1.8,
                      ),
              ),
              20.verticalSpace.toSliver,
              SliverToBoxAdapter(
                child: Text(context.l10n.beforeAPODs),
              ),
              12.verticalSpace.toSliver,
              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: (apods.length - 1) + (isLoading ? 5 : 0),
                itemBuilder: (context, index) {
                  if ((apods.length - 1) <= index) {
                    return const ShimmerCard(aspectRatio: 1);
                  }
                  final fixIndex = index + 1;
                  final apod = apods[fixIndex];
                  return APODImageCard(
                    onTap: () => context.pushNamed(
                      AppRoutes.apod.name,
                      extra: fixIndex,
                    ),
                    apod: apod,
                  );
                },
              ),
              if (apods.isNotEmpty && isLoading) ...[
                40.verticalSpace.toSliver,
              ],
              20.verticalSpace.toSliver,
            ],
          ),
        );
      },
    );
  }
}
