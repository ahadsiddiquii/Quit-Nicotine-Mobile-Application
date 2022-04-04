import 'package:nicotine/models/User.dart';

class PostLike {
  String? userLikeId;
  String? postId;

  PostLike({
    required this.userLikeId,
    required this.postId,
  });

  PostLike.fromJson(Map<String, dynamic> json) {
    this.userLikeId = json['userLikeId'] ?? "";
    this.postId = json['postId'] ?? "";
  }
}
