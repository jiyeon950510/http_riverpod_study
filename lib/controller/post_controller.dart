import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import '../model/post/post_repository.dart';
import '../view/pages/post/home/post_home_page_view_model.dart';


final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    ref.read(PostHomePageProvider.notifier).init(postDtoList);
  }
}