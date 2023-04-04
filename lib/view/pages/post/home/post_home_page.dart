import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'post_home_page_view_model.dart';

class PostHomePage extends ConsumerWidget {
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pCon = ref.read(postController);
    PostHomePageModel? pm = ref.watch(PostHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: pm != null
                  ? buildListView(pm.posts)
                  : buildListView([])),
          ElevatedButton(
            onPressed: () {
              pCon.findPosts();
            },
            child: Text("페이지 로드"),
          ),
        ],
      ),
    );
  }

  ListView buildListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text("${posts[index].id}"),
        title: Text("${posts[index].title}"),
      ),
    );
  }
}
