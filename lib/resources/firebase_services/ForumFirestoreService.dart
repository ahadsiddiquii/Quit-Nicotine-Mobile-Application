import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/models/Post.dart';
import 'package:nicotine/models/PostLike.dart';

import 'dart:convert';

import '../../models/User.dart';
import '../../utils/globals.dart';
import '../../utils/local_storage.dart';

class ForumFirestoreService {
  final String collectionName = "forum";

  // Future<void> checkAffirmationDone(Affirmation currentAffirmation) async {
  //   print("ForumFirestoreService: checkAffirmationDone Function");

  //   try {
  //     final Map<String, dynamic> affirmationMap = {
  //       "affirmationId": currentAffirmation.affirmationId,
  //       "userEmail": Storage.getValue("UserEmail") ?? "emptyEmail",
  //       "dateTime": currentAffirmation.dateTime!.toIso8601String(),
  //       "affirmationMessage": currentAffirmation.affirmationMessage,
  //       "isMorning": currentAffirmation.isMorning,
  //       "isMidDay": currentAffirmation.isMidDay,
  //       "isNight": currentAffirmation.isNight,
  //       "isMorningDone": currentAffirmation.isMorningDone,
  //       "isMidDayDone": currentAffirmation.isMidDayDone,
  //       "isNightDone": currentAffirmation.isNightDone,
  //       "isDone": currentAffirmation.isDone,
  //     };

  //     FirebaseFirestore.instance
  //         .collection(collectionName)
  //         .doc(currentAffirmation.affirmationId)
  //         .set(affirmationMap)
  //         .catchError((e) {
  //       print(e.toString());
  //     });
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<bool> createPost(
    User user,
    String postDescription,
    String postImage,
  ) async {
    print("ForumFirestoreService: createPost Function");
    String postId = DateTime.now().toIso8601String() + "_" + user.userEmail!;
    // DateTime.now().toIso8601String() + Storage.getValue("UserEmail");
    try {
      final image = File(postImage);
      List<int> imageBytes = await image.readAsBytes();

      final base64Image = base64Encode(imageBytes);

      final Map<String, dynamic> postMap = {
        "postId": postId,
        "user": user.toJson(user),
        "postDescription": postDescription,
        "postImage": base64Image,
        "postLikes": [],
        "postComments": [],
        "postCreated": DateTime.now().toIso8601String(),
      };
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(postId)
          .set(postMap)
          .catchError((e) {
        print(e.toString());
      });
      // FirebaseFirestore.instance.collection(collectionName).add(affirmationMap);
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> updateAPost(
    User user,
    Post post,
    String postDescription,
    String postImage,
  ) async {
    print("ForumFirestoreService: updateAPost Function");
    // String postId = DateTime.now().toIso8601String() + "_" + user.userEmail!;
    // DateTime.now().toIso8601String() + Storage.getValue("UserEmail");
    try {
      final image = File(postImage);
      List<int> imageBytes = await image.readAsBytes();

      final base64Image = base64Encode(imageBytes);

      final Map<String, dynamic> postMap = {
        "postId": post.postId,
        "user": user.toJson(user),
        "postDescription": postDescription,
        "postImage": base64Image,
        "postLikes": post.postLikes,
        "postComments": post.postLikes,
        "postCreated": post.postCreated!.toIso8601String(),
      };
      FirebaseFirestore.instance
          .collection(collectionName)
          .doc(post.postId)
          .set(postMap)
          .catchError((e) {
        print(e.toString());
      });
      // FirebaseFirestore.instance.collection(collectionName).add(affirmationMap);
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Post>> getAllForumPosts() async {
    print("ForumFirestoreService: getAllForumPosts Function");
    try {
      var map = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc()
          .snapshots();
      CollectionReference _collectionRef =
          FirebaseFirestore.instance.collection(collectionName);

      QuerySnapshot querySnapshot = await _collectionRef.get();

      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) {
        return doc.data();
      }).toList();

      print(allData);

      List<Post> allPosts = [];
      allData.forEach((item) {
        final affirm = item as Map<String, dynamic>;
        // if (affirm["user"]["userId"] == Storage.getValue("userId")) {
        allPosts.add(Post.fromJson(affirm));
        // }
      });
      print("All Posts: ${allPosts.length}");

      return allPosts.reversed.toList();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> likePost(User user, Post post) async {
    print("ForumFirestoreService: likePost Function");

    bool postFound = false;

    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .where("postId", isEqualTo: post.postId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          postFound = true;

          PostLike postLike =
              PostLike(userLikeId: user.userId, postId: post.postId);
          List<PostLike> postLikes = post.postLikes!;

          postLikes.add(postLike);
          print("Post found");
          print(jsonEncode(postLikes));
          print("Post found");
          final Map<String, dynamic> postMap = {
            "postId": post.postId,
            "user": user.toJson(user),
            "postDescription": post.postDescription,
            "postImage": post.postImage,
            "postLikes": jsonEncode(postLikes),
            "postComments": post.postComments,
            "postCreated": DateTime.now().toIso8601String(),
          };

          // FirebaseFirestore.instance
          //     .collection(collectionName)
          //     .doc(post.postId)
          //     .set(postMap)
          //     .catchError((e) {
          //   print(e.toString());
          // });
        });
      });
      if (!postFound) {
        print("Email not found");
        throw "Email not found";
      }

      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> deletePost(String postId) async {
    print("ForumFirestoreService: deletePost Function");
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(postId)
          .delete();

      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
