import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softroniics/helpers/const/const.dart';
import 'package:softroniics/view/splash/splash.dart';

class GuidSection extends StatelessWidget {
  const GuidSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Card(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      Text('Avoi the scare of\ncoronavirus',
                          textAlign: TextAlign.center,
                          style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  FirebaseAuth.instance.signOut().then((value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const ScreenSplash()),
                                        (route) => false);
                                  });
                                } catch (e) {
                                  log(e.toString());
                                }
                              },
                              child:
                                  const Text('call', style: normalTextStyle)),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/corona.png'))),
                ))
              ],
            ),
          ),
        ));
  }
}
