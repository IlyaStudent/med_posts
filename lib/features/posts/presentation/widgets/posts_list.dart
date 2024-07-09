import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/post_full_info.dart';
import 'package:med_posts/features/posts/presentation/widgets/post_widget.dart';

class PostsList extends StatelessWidget {
  final List<PostFullInfo> postsList;
  const PostsList({super.key, required this.postsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: PostWidget(post: postsList[index]),
        );
      },
    );
  }
}
