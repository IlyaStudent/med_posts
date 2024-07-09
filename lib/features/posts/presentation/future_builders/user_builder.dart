import 'package:flutter/material.dart';
import 'package:med_posts/features/posts/data/models/user.dart';
import 'package:med_posts/features/posts/data/repositories/posts_repository.dart';
import 'package:med_posts/features/posts/presentation/widgets/error_desc_widget.dart';
import 'package:med_posts/features/posts/presentation/widgets/loading_indicator.dart';

class UserBuilder extends StatefulWidget {
  final int userId;
  const UserBuilder({super.key, required this.userId});

  @override
  State<UserBuilder> createState() => _UserBuilderState();
}

class _UserBuilderState extends State<UserBuilder> {
  late Future<User> postsData = PostsRepository().getUserById(widget.userId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postsData,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("");
          } else if (snapshot.hasError) {
            return ErrorDescWidget(errorDesc: snapshot.error.toString());
          } else if (snapshot.hasData) {
            final User? user = snapshot.data;
            return Text("Автор: ${user?.username} (${user?.email})");
          }
          return const LoadingIndicator();
        }));
  }
}
