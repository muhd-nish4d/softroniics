import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:softroniics/helpers/enums/enum.dart';
import 'package:softroniics/helpers/helper/helper.dart';

class ProviderAuth extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CurrentUserSatatus? userStatus;
  CallStatus? status;
  String errorMessage = '';
  bool isPasswordVisible = false;
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

  void changePasswordVisibility() {
    if (isPasswordVisible) {
      isPasswordVisible = false;
    } else {
      isPasswordVisible = true;
    }
    notifyListeners();
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

  Future<void> loginWithGoogleAC() async {
    status = CallStatus.waiting;
    notifyListeners();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    try {
      if (googleSignInAccount != null) {
        // Handle successful Google sign-in
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final String? idToken = googleSignInAuthentication.idToken;
        final String? accessToken = googleSignInAuthentication.accessToken;

        final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: idToken,
          accessToken: accessToken,
        );
        await firebaseAuth.signInWithCredential(credential);
        status = CallStatus.success;
        notifyListeners();
      } else {
        log('else');
        status = CallStatus.failed;
        notifyListeners();
      }
    } catch (e) {
      status = CallStatus.failed;
      notifyListeners();
      log(e.toString());
    }
  }
}
