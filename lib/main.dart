import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page.dart';



final helloWorldProvider = Provider <String> ((ref) {
  return "Hello World";
});


void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.read(helloWorldProvider);

    return MaterialApp(
      home: MaterialApp(
        home: PostHomePage(),
      ),
    );
  }
}