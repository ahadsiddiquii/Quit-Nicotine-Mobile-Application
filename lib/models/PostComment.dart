import 'package:nicotine/models/User.dart';

class PostComment {
  String? postCommentId;
  String? postCommentText;
  User? user;

  PostComment({
    required this.postCommentId,
    required this.postCommentText,
    required this.user,
  });

  PostComment.fromJson(Map<String, dynamic> json) {
    this.postCommentId = json['postCommentId'] ?? "";
    this.postCommentText = json['postCommentText'] ?? "";
    this.user = User.fromJson(json['user']);
  }
}
