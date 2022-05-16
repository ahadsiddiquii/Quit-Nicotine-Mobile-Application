import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nicotine/blocs/Activity/activity_bloc.dart';
import 'package:nicotine/models/MyActivity.dart';
import 'package:nicotine/utils/local_storage.dart';

import '../../models/User.dart';

class MyActivityFirestoreService {
  final String collectionName = "activity";

  Future<bool> addActivity(
      User user,
      String activityName,
      String foodAte,
      int glassesOfWater,
      int stepsWalked,
      int cigarettesSmoked,
      int herbalMixed,
      int activityPoints) async {
    print("MyActivityFirestoreService: addActivity Function");
    String activityId =
        DateTime.now().toIso8601String() + "_" + user.userEmail!;
    // DateTime.now().toIso8601String() + Storage.getValue("UserEmail");
    try {
      final Map<String, dynamic> activityMap = {
        "activityId": activityId,
        "user": user.toJson(user),
        "activityName": activityName,
        "glassesOfWater": glassesOfWater,
        "foodAte": foodAte,
        "stepsWalked": stepsWalked,
        "glassesOfWater": glassesOfWater,
        "cigarettesSmoked": collectionName,
        "herbalMix": herbalMixed,
        "activityCreationDate": DateTime.now().toIso8601String(),
        "activityPoints": activityPoints,
      };
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(activityId)
          .set(activityMap)
          .catchError((e) {
        print(e.toString());
      });

      Map<String, dynamic> userMap = {
        "userId": user.userId,
        "userEmail": user.userEmail,
        "userName": user.userName,
        "userPassword": user.userPassword,
        "userImage": user.userImage,
        "userPoints": user.userPoints! + 10,
        "userMistakes": user.userMistakes,
        "userQuestionsAsked": true
      };
      await FirebaseFirestore.instance
          .collection("user")
          .doc(user.userId)
          .set(userMap)
          .catchError((e) {
        print(e.toString());
      });

      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<UserActivity>> getUserActivities() async {
    print("MyActivityFirestoreService: getUserActivities Function");
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

      List<UserActivity> allPosts = [];
      allData.forEach((item) {
        final affirm = item as Map<String, dynamic>;
        if (affirm["user"]["userId"] == Storage.getValue("userId")) {
          allPosts.add(UserActivity.fromJson(affirm));
        }
      });
      print("All Activities: ${allPosts.length}");
      return allPosts;
    } catch (e) {
      throw e.toString();
    }
  }
}
