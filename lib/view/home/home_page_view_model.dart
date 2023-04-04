import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/post_response_dto.dart';


// 창고 관리자 (Provider)
final homePageViewModel =
    StateNotifierProvider<HomePageViewModel, HomePageModel?>((ref) {
  return HomePageViewModel(null);
});

// 창고 (Store)
class HomePageViewModel extends StateNotifier<HomePageModel?> {
  HomePageViewModel(super.state);

  void init(List<PostDto> postDtoList){
    state = HomePageModel(posts: postDtoList);
  }
}

// 창고 데이터
class HomePageModel {
  List<PostDto> posts;

  HomePageModel({required this.posts});
}
