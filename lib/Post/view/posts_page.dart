import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings_page.dart';
import '../bloc/post_bloc.dart';
import '../widget/loading_widget.dart';
import '../widget/post_list_item.dart';


class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    //لمعرفة اعظم قيمة ممكن يصلها اليوزر
    final maxScroll = _scrollController.position.maxScrollExtent;
    //لمعرفة اليوزر وين واقف حاليا من الليست
    final currentScroll = _scrollController.offset;
    //اذا وصل لقبل النهاية بشوية حيطلب الريكويست
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<PostBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Posts"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const SettingsPage())),
                icon: const Icon(Icons.settings))
          ],
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.status) {
              case PostStatus.loading:
                return const LoadingWidget();
              case PostStatus.success:
                if (state.posts.isEmpty) {
                  return const Center(
                    child: Text("No Posts"),
                  );
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.posts.length
                        ? const LoadingWidget()
                        : PostListItem(post: state.posts[index]);
                  },
                );
              case PostStatus.error:
                return Center(
                  child: Text(state.errorMessage),
                );
            }
          },
        ));
  }
}