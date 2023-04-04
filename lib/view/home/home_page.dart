import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/view/home/home_page_view_model.dart';

import '../../dto/post_response_dto.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pCon = ref.read(postController);
    HomePageModel? hpm = ref.watch(homePageViewModel);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: hpm != null
                  ? buildListView(hpm.posts)
                  : CircularProgressIndicator()),
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

  ListView buildListView(List<PostDto> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => ListTile(
        leading: Text("${posts[index].id}"),
        title: Text("${posts[index].title}"),
      ),
    );
  }
}
