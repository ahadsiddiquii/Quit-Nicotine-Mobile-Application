import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/Post.dart';
import '../../models/PostLike.dart';
import '../../models/User.dart';
import '../../resources/firebase_services/ForumFirestoreService.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumBloc() : super(ForumInitial());
  final forumService = ForumFirestoreService();

  @override
  Stream<ForumState> mapEventToState(
    ForumEvent event,
  ) async* {
    if (event is GetAllForumPosts) {
      try {
        print("ForumBloc: GetAllForumPosts event");

        final allPosts = await forumService.getAllForumPosts();
        yield AllPostsRetrieved(posts: allPosts);
      } catch (e) {
        print('Error in InsertAffirmation event: $e');
        yield ForumError(error: e.toString());
      }
    } else if (event is CreateAPost) {
      try {
        print("ForumBloc: CreateAPost event");

        final added = await forumService.createPost(
          event.user,
          event.postDescription,
          event.postImage,
        );

        yield PostAdded();
      } catch (e) {
        print('Error in InsertAffirmation event: $e');
        yield ForumError(error: e.toString());
      }
    } else if (event is LikeAPost) {
      try {
        print("ForumBloc: LikeAPost event");

        final added = await forumService.likePost(
          event.user,
          event.post,
        );
        yield PostAdded();
      } catch (e) {
        print('Error in InsertAffirmation event: $e');
        yield ForumError(error: e.toString());
      }
    } else if (event is CommentAPost) {
    } else if (event is ResetForumState) {
      yield ForumInitial();
    }
  }
}
