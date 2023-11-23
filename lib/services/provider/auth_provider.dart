import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softroniics/services/helpers/enums/enum.dart';
import 'package:softroniics/services/helpers/helper/helper.dart';

class ProviderAuth extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CurrentUserSatatus? userStatus;
  CallStatus? status;
  String errorMessage = '';
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  //check current user login or logout
  void isLoginedUser() {
    User? userCurrent = firebaseAuth.currentUser;
    if (userCurrent == null) {
      userStatus = CurrentUserSatatus.logout;
      notifyListeners();
    } else {
      userStatus = CurrentUserSatatus.logined;
    }
  }

  Future<void> registerUser() async {
    status = CallStatus.waiting;
    notifyListeners();
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.createUserWithEmailAndPassword(
        email: emialController.text,
        password: passwordController.text,
      );
      Helper.storeUserData({
        'name': nameController.text,
        'phone': phoneController.text,
        'mail': emialController.text
      });
      status = CallStatus.success;
      notifyListeners();
      log('suc');
    } catch (e) {
      errorMessage = e.toString();
      status = CallStatus.failed;
      notifyListeners();
      log(e.toString());
    }
    log(status.toString());
  }

  Future<void> loginUser() async {
    status = CallStatus.waiting;
    notifyListeners();
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(
        email: emialController.text,
        password: passwordController.text,
      );
      status = CallStatus.success;
      notifyListeners();
      log('suc');
    } catch (e) {
      errorMessage = e.toString();
      status = CallStatus.failed;
      notifyListeners();
      log(e.toString());
    }
    log(status.toString());
  }
}
