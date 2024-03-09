import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/requests/media_content_request.dart';
import 'package:nasa_app_challenge/features/searches/presentation/blocs/search/search_bloc.dart';
import 'package:nasa_app_challenge/features/searches/presentation/widgets/media_content_card.dart';
import 'package:ui_common/ui_common.dart';

class RequestCubit extends ValueCubit<MediaContentRequest> {
  RequestCubit({
    super.value = const MediaContentRequest(page: 1),
  });
}

class SearchContentsPage extends StatelessWidget {
  const SearchContentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RequestCubit(),
        ),
        BlocProvider(
          create: (_) => GetIt.I.get<SearchBloc>(),
        ),
      ],
      child: const _SearchContentsView(),
    );
  }
}

class _SearchContentsView extends StatefulWidget {
  const _SearchContentsView();

  @override
  State<_SearchContentsView> createState() => _SearchContentsViewState();
}

class _SearchContentsViewState extends State<_SearchContentsView> {
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
      context.read<SearchBloc>().add(const SearchEvent.fetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        actions: [
          50.horizontalSpace,
          Expanded(
            child: Hero(
              tag: 'search-text-field',
              child: Material(
                type: MaterialType.transparency,
                child: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    context.read<SearchBloc>().add(
                          SearchEvent.performSearch(value),
                        );
                  },
                  textInputAction: TextInputAction.search,
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
          12.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                final isLoading =
                    state.whenOrNull(loading: () => true) ?? false;
                final contents = state.whenOrNull(
                      success: (results) => results,
                      fetching: (results) => results,
                    ) ??
                    [];
                return GridView.builder(
                  controller: _controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  padding: 12.edgeInsetsA,
                  itemCount: contents.length + (isLoading ? 4 : 0),
                  itemBuilder: (context, index) {
                    if ((contents.length - 1) <= index) {
                      return const ShimmerCard(aspectRatio: 1);
                    }
                    final fixIndex = index + 1;
                    final content = contents[fixIndex];
                    return MediaContentCard(
                      onTap: () => context.pushNamed(
                        AppRoutes.mediaContent.name,
                        extra: content,
                      ),
                      content: content,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
