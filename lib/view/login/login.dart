import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/services/helpers/enums/enum.dart';
import 'package:softroniics/services/provider/auth_provider.dart';
import 'package:softroniics/view/home/home.dart';
import 'package:softroniics/view/login/widget/customTextField.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key, this.isLogin});
  final bool? isLogin;
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
                    SizedBox(
                      width: double.infinity,
                      height: size.width * .35,
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: isLogin ?? true,
                      child: Column(
                        children: [
                          CustomTextField(
                            heading: 'Your Name:',
                            hintText: 'Enter your full name',
                            suffixIcon: Icons.person,
                            // keyboardType: TextInputType.name,
                            // textCapitalization: TextCapitalization.sentences,
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
                              // keyboardType: TextInputType.emailAddress,
                              // textCapitalization: TextCapitalization.none,
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
                        // obscureText: true,
                        // maxLength: 6,
                        keyboardType: TextInputType.emailAddress,
                        // textCapitalization: TextCapitalization.none,
                        // controller: _passwordController,
                        validator: (textVal) {
                          if (textVal == null || textVal.isEmpty) {
                            return 'Enter your mail id';
                          } else {
                            return null;
                          }
                        }),
                    CustomTextField(
                        heading: 'Password:',
                        suffixIcon: Icons.password_rounded,
                        controller: value.passwordController,
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
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.blue),
                              backgroundColor: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Image.asset('assets/images/google.png')),
                    ),
                    const SizedBox(height: 20),
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
                                  if (isLogin == null || isLogin!) {
                                    await value.registerUser().then((val) {
                                      if (value.status == CallStatus.failed) {
                                        var snackdemo = SnackBar(
                                          content: Text(value.errorMessage),
                                          backgroundColor: Colors.green,
                                          elevation: 10,
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.all(5),
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    ScreenHome()));
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
                                          margin: EdgeInsets.all(5),
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const ScreenHome()));
                                      }
                                    });
                                  }
                                }
                              }
                            },
                            child: value.status == CallStatus.waiting
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const Text('Create an accout')),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ScreenLogin(
                                        isLogin: false,
                                      )));
                        },
                        child: const Text('Already registered'))
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
