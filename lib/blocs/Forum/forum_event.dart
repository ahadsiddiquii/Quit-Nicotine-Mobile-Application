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

class ResetForumState extends ForumEvent {}
