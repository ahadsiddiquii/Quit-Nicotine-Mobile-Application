import 'package:cloud_firestore/cloud_firestore.dart';

class MyActivityFirestoreService {
  createActivity(String userId, activityMap) {
    FirebaseFirestore.instance
        .collection("userActivity")
        .doc(userId)
        .set(activityMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
