import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/services/helpers/enums/enum.dart';
import 'package:softroniics/services/provider/auth_provider.dart';
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              } else {
                                return '';
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your phone number';
                                } else {
                                  return '';
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
                            return '';
                          }
                        }),
                    CustomTextField(
                        heading: 'Password:',
                        suffixIcon: Icons.password_rounded,
                        controller: value.passwordController,
                        hintText: '**************',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Create password';
                          } else if (value.length < 5) {
                            return 'Create a strong password';
                          } else {
                            return '';
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
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ScreenLogin(
                                      isLogin: false,
                                    )));
                          },
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
                              if (isLogin == null || isLogin!) {
                                await value.registerUser();
                              } else {
                                await value.loginUser();
                              }
                              if (!_key.currentState!.validate()) {
                                log('missing');
                              }
                              if (value.status == null ||
                                  value.status == CallStatus.failed) {
                                log(value.emialController.text);
                                log(value.phoneController.text);
                                log(value.nameController.text);
                                log(value.passwordController.text);
                                // log(value.emialController.text);
                              }
                            },
                            child: const Text('Create an accout')),
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
                        child: Text('Already'))
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
