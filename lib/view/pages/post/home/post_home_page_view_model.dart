import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';



// 창고 관리자 (Provider)
final PostHomePageProvider =
    StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});

// 창고 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?> {
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList){
    state = PostHomePageModel(posts: postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts;
    // posts.add(post);
    List<Post> newPosts = [...posts,post]; //정규연산자 >> 깊은복사
    state = PostHomePageModel(posts: newPosts);
// 조건 1. 새로운 값 레퍼런스가 달라짐 (값이 동일해도 다시 그려진다.) -> 새로운 레퍼런스를 만들어내야해
  //변경 감지 연산이 줄어듦, new 연산이 줄어듦, 뷰 렌더링이 줄어듦,
  }

  void remove(int id){
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.where((e) => e.id != id).toList();
    //where 은 검색과 삭제
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post){
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }
}



// 창고 데이터
class PostHomePageModel {
  List<Post> posts;
  PostHomePageModel({required this.posts});
}
