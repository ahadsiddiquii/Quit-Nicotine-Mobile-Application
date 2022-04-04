part of 'forum_bloc.dart';

@immutable
abstract class ForumEvent {}

class GetAllForumPosts extends ForumEvent {}

// class UpdateAffirmation extends AffirmationsEvent {
//   final Affirmation affirmation;
//   UpdateAffirmation({
//     required this.affirmation,
//   });
// }

class CreateAPost extends ForumEvent {
  final User user;
  final String postDescription, postImage;

  CreateAPost({
    required this.user,
    required this.postDescription,
    required this.postImage,
  });
}

class LikeAPost extends ForumEvent {
  final User user;
  final Post post;

  LikeAPost({
    required this.user,
    required this.post,
  });
}

class CommentAPost extends ForumEvent {
  final User user;
  final String postId;
  final String comment;

  CommentAPost({
    required this.user,
    required this.postId,
    required this.comment,
  });
}

class ResetForumState extends ForumEvent {}
