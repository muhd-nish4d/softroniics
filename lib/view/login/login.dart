import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/helpers/enums/enum.dart';
import 'package:softroniics/services/provider/auth_provider.dart';
import 'package:softroniics/view/home/home.dart';
import 'package:softroniics/view/login/widget/customTextField.dart';
import 'package:softroniics/view/login/widget/login_screen_lottie.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key, this.isRegister = true});
  final bool isRegister;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: Consumer<ProviderAuth>(builder: (context, value, child) {
            return SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40),
                    isRegister
                        ? const RegisterLottie(
                            lottiePath: 'assets/lottie/join_with_us.json',
                            head: 'Join Us!')
                        : const RegisterLottie(
                            lottiePath: 'assets/lottie/password.json',
                            head: 'Login'),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: isRegister,
                      child: Column(
                        children: [
                          CustomTextField(
                            heading: 'Your Name:',
                            hintText: 'Enter your full name',
                            suffixIcon: Icons.person,
                            validator: (txtVal) {
                              if (txtVal == null || txtVal.isEmpty) {
                                return 'Please enter your name';
                              } else {
                                return null;
                              }
                            },
                            controller: value.nameController,
                          ),
                          CustomTextField(
                              heading: 'Your Mobile:',
                              keyboardType: TextInputType.number,
                              suffixIcon: Icons.person,
                              hintText: 'Mobile number',
                              validator: (txtVal) {
                                if (txtVal == null || txtVal.isEmpty) {
                                  return 'Enter your phone number';
                                } else {
                                  return null;
                                }
                              },
                              controller: value.phoneController),
                        ],
                      ),
                    ),
                    CustomTextField(
                        heading: 'Your Email:',
                        suffixIcon: Icons.mail,
                        controller: value.emialController,
                        hintText: 'hello@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (textVal) {
                          if (textVal == null || textVal.isEmpty) {
                            return 'Enter your mail id';
                          } else {
                            return null;
                          }
                        }),
                    CustomTextField(
                        isObsecure: !value.isPasswordVisible,
                        heading: 'Password:',
                        suffixIcon: value.isPasswordVisible
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye,
                        controller: value.passwordController,
                        isClickeble: true,
                        hintText: '**************',
                        validator: (txtVal) {
                          if (txtVal == null || txtVal.isEmpty) {
                            return 'Create password';
                          } else if (txtVal.length < 5) {
                            return 'Create a strong password';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.blue[100],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('or',
                              style: TextStyle(color: Colors.blue[100])),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.blue[100],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Login with google account
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: OutlinedButton(
                          onPressed: () async {
                            value.loginWithGoogleAC().then((val) {
                              if (value.status == CallStatus.success) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const ScreenHome()),
                                    (Route<dynamic> route) => false);
                              } else {}
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.blue),
                              backgroundColor: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Image.asset('assets/images/google.png')),
                    ),
                    const SizedBox(height: 20),

                    // Login/Register Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white),
                            onPressed: () async {
                              if (!_key.currentState!.validate()) {
                                log('missing');
                              } else {
                                if (value.status == null ||
                                    value.status == CallStatus.failed) {
                                  if (isRegister) {
                                    await value.registerUser().then((val) {
                                      if (value.status == CallStatus.failed) {
                                        var snackdemo = SnackBar(
                                          content: Text(value.errorMessage),
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          behavior: SnackBarBehavior.floating,
                                          margin: const EdgeInsets.all(5),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackdemo);
                                      } else {
                                        const snackdemo = SnackBar(
                                          content: Text('Registerd'),
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.all(5),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackdemo);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const ScreenHome()),
                                            (Route<dynamic> route) => false);
                                      }
                                    });
                                  } else {
                                    await value.loginUser().then((val) {
                                      if (value.status == CallStatus.failed) {
                                        var snackdemo = SnackBar(
                                          content: Text(value.errorMessage),
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          behavior: SnackBarBehavior.floating,
                                          margin: const EdgeInsets.all(5),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackdemo);
                                      } else {
                                        const snackdemo = SnackBar(
                                          content: Text('Logined'),
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.all(5),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackdemo);
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const ScreenHome()),
                                            (Route<dynamic> route) => false);
                                      }
                                    });
                                  }
                                }
                              }
                            },
                            child: value.status == CallStatus.waiting
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    isRegister ? 'Create an accout' : 'Login')),
                      ),
                    ),
                    // Button for Navigate to LoginScreen from Register Screen
                    Visibility(
                      visible: isRegister,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ScreenLogin(
                                          isRegister: false,
                                        )));
                          },
                          child: const Text('Already registered')),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
