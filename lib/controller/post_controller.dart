import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/repository/Post_repository.dart';
import 'package:http_riverpod_app/view/home/home_page_view_model.dart';

import '../dto/post_response_dto.dart';


final postController = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<PostDto> postDtoList = await PostRepository().findAll();
    ref.read(homePageViewModel.notifier).init(postDtoList);
  }
}