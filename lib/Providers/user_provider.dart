import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tempcallavet/model/user_model.dart';

class UserProvider with ChangeNotifier {
  /// Add User to Firebase
  void addUserData({
    User? currentUser,
    String? userName,
    String? userEmail,
    String? userRole,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .set(
      {
        "name": userName,
        "email": userEmail,
        "role": userRole,
        "userUid": currentUser.uid,
      },
    );
  }

  /// Fetch User from Firebase
  late UserModel currentUserData;
  void fetchUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        email: value.get("userEmail"),
        name: value.get("userName"),
        role: value.get("userRole"),
        uid: value.get("userUid"),
      );
      currentUserData = userModel;
      // "notifyListeners" same mean as "setState"
      notifyListeners();
    }
  }

  // Getter function of UserModel
  UserModel get getCurrentUserData {
    return currentUserData;
  }
}
