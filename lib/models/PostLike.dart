import 'package:nicotine/models/User.dart';

class PostLike {
  String? postLikeId;
  User? user;

  PostLike({
    required this.postLikeId,
    required this.user,
  });

  PostLike.fromJson(Map<String, dynamic> json) {
    this.postLikeId = json['postLikeId'] ?? "";
    this.user = User.fromJson(json['user']);
  }
}
