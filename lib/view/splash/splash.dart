import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softroniics/helpers/enums/enum.dart';
import 'package:softroniics/services/provider/auth_provider.dart';
import 'package:softroniics/view/home/home.dart';
import 'package:softroniics/view/login/login.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
                width: double.infinity,
                height: size.height * .4,
                child: LottieBuilder.asset('assets/lottie/lets_begin.json')),
            const Text(
              "Ready to Feast?\nLet's Begin",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ProviderAuth>(context, listen: false)
                            .isLoginedUser();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Consumer<ProviderAuth>(
                                        builder: (context, value, child) {
                                      if (value.userStatus ==
                                          CurrentUserSatatus.logout) {
                                        return ScreenLogin();
                                      } else if (value.userStatus ==
                                          CurrentUserSatatus.logined) {
                                        return const ScreenHome();
                                      } else {
                                        return ScreenLogin();
                                      }
                                    })));
                      },
                      child: const Text('Get Started'))),
            )
          ],
        ),
      ),
    );
  }
}
