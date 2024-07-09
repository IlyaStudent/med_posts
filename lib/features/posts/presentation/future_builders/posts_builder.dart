import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/post.dart';
import 'package:med_posts/features/posts/data/repositories/posts_repository.dart';
import 'package:med_posts/features/posts/presentation/widgets/error_desc_widget.dart';
import 'package:med_posts/features/posts/presentation/widgets/loading_indicator.dart';
import 'package:med_posts/features/posts/presentation/widgets/posts_list.dart';

class PostsBuilder extends StatefulWidget {
  const PostsBuilder({super.key});

  @override
  State<PostsBuilder> createState() => _PostsBuilderState();
}

class _PostsBuilderState extends State<PostsBuilder> {
  late Future<List<Post>> postsData = PostsRepository().getAllPosts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postsData,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            return ErrorDescWidget(errorDesc: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return PostsList(postsList: snapshot.data!);
          }
          return const LoadingIndicator();
        }));
  }
}
