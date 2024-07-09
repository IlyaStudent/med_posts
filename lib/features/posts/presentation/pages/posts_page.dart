import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/presentation/future_builders/posts_builder.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PostsBuilder(),
      ),
    );
  }
}
