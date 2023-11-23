import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/services/helpers/enums/enum.dart';
import 'package:softroniics/services/provider/auth_provider.dart';
import 'package:softroniics/view/home/home.dart';
import 'package:softroniics/view/login/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Provider.of<ProviderAuth>(context, listen: false).isLoginedUser();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Consumer<ProviderAuth>(builder: (context, value, child) {
                    if (value.userStatus == CurrentUserSatatus.logout) {
                      return ScreenLogin();
                    } else if (value.userStatus == CurrentUserSatatus.logined) {
                      return const ScreenHome();
                    } else {
                      return ScreenLogin();
                    }
                  })));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
