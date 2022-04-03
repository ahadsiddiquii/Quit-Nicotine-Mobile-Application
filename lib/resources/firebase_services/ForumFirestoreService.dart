import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nicotine/models/Post.dart';

import 'dart:convert';

import '../../models/User.dart';
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
    String postId = DateTime.now().toIso8601String() + "_hassan@gmail.com";
    // DateTime.now().toIso8601String() + Storage.getValue("UserEmail");
    try {
      final Map<String, dynamic> postMap = {
        "postId": postId,
        "user": user.toJson(user),
        "postDescription": postDescription,
        "postImage": postImage,
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
        // if (affirm["userEmail"] == Storage.getValue("UserEmail")) {
        allPosts.add(Post.fromJson(affirm));
        // }
      });
      print("All Posts: ${allPosts.length}");
      return allPosts;
    } catch (e) {
      throw e.toString();
    }
  }
}



// uploadUserInfo(userMap) {
//   FirebaseFirestore.instance.collection("users").add(userMap);
//   print(userMap);
// }

// Future<Map<String, dynamic>> uploadUserInfo(
//     userMap, BuildContext context) async {
//   bool exists = false;
//   String sameDocId = "null";
//   FirebaseFirestore.instance
//       .collection('users')
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       if (doc["email"] == userMap["email"]) {
//         exists = true;
//         print('DocumentID: ${doc.id}');
//         sameDocId = doc.id;
//         print("Document found in Firestore");
//       }
//       // print(doc["email"]);
//     });
//     print("INSIDE FUNCTION");
//     if (exists == false) {
//       print("Adding Document");
//       FirebaseFirestore.instance.collection("users").add(userMap);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(showSnackbar("User registered successfully"));
//       Get.toNamed(AppLinks.bottomNavBar);
//       return {"Status_Code": 200, "Status_Message": "User registered"};
//     } else {
//       print("Document already exists");

//       return {
//         "Status_Code": 200,
//         "Status_Message": "User already exists. Please login"
//       };

//       // FirebaseFirestore.instance
//       //     .collection("users")
//       //     .doc(sameDocId)
//       //     .set(userMap);
//     }
//   }).then((value) {
//     if (exists) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(showSnackbar("User already exists. Please login"));
//     }
//   });
//   return {"Status_Code": 404, "Status_Message": "Some error occured"};
// }

// getUserByName(String username) async {
//   return await FirebaseFirestore.instance
//       .collection("users")
//       .where("name", isEqualTo: username)
//       .get();
// }

// createChatRoom(String chatRoomId, chatRoomMap) {
//   FirebaseFirestore.instance
//       .collection("chatroom")
//       .doc(chatRoomId)
//       .set(chatRoomMap)
//       .catchError((e) {
//     print(e.toString());
//   });
// }

// addConversationMessages(String chatRoomId, messageMap) {
//   FirebaseFirestore.instance
//       .collection("chatroom")
//       .doc(chatRoomId)
//       .collection("chats")
//       .add(messageMap)
//       .catchError((e) {
//     print(e.toString());
//   });
// }

// getConversationMessages(String chatRoomId) async {
//   return await FirebaseFirestore.instance
//       .collection("chatroom")
//       .doc(chatRoomId)
//       .collection("chats")
//       .orderBy("time", descending: false)
//       .snapshots();
// }

// getChatRoom(String userEmail) async {
//   return await FirebaseFirestore.instance
//       .collection("chatroom")
//       .where("users", arrayContains: userEmail)
//       .snapshots();
// }

// userLogin(String userEmail, String password, BuildContext context) async {
//   bool successfulLogin = false;
//   print(userEmail);
//   print(password);
//   FirebaseFirestore.instance
//       .collection("users")
//       .where("email", isEqualTo: userEmail)
//       .get()
//       .then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((doc) {
//       print("Email Found");
//       if (doc["password"] == password) {
//         successfulLogin = true;
//         print("Successful login");
//         ScaffoldMessenger.of(context)
//             .showSnackBar(showSnackbar("Logged in successfully"));
//         Get.toNamed(AppLinks.bottomNavBar);
//       } else {
//         // ScaffoldMessenger.of(context).showSnackBar(
//         //     showSnackbar("Please check if your email or password is correct"));
//       }
//     });
//   }).then((value) {
//     if (!successfulLogin) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           showSnackbar("Please check if your email or password is correct"));
//     }
//   });
//   // if (!successfulLogin) print("uns00 login");
// }
