import 'package:http_riverpod_app/model/post/post.dart';

import '../../dto/post/post_response_dto.dart';

class PostRepository {
  static PostRepository _instance = PostRepository._single();

  PostRepository._single(); //싱글톤?????
  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(Duration(seconds: 1), () {
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  Future<Post> save(String title) {
    return Future.delayed(Duration(seconds: 1), () {
      return Post(id: 4, title: "제목2");
    });
  }

  Future<void> deleteById(int id) {
    return Future.delayed(Duration(seconds: 1), () {});
  }

  Future<Post> update(Post post) {
    return Future.delayed(Duration(seconds: 1), () {
      return post;
    });
  }
}
