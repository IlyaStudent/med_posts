import 'package:json_annotation/json_annotation.dart';

part 'post_comment.g.dart';

@JsonSerializable()
class PostComment {
  PostComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) =>
      _$PostCommentFromJson(json);
  Map<String, dynamic> toJson() => _$PostCommentToJson(this);

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
}
