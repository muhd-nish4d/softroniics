import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Home')),
      ),
    );
  }
}
