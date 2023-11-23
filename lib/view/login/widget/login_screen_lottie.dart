import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterLottie extends StatelessWidget {
  const RegisterLottie(
      {super.key, required this.lottiePath, required this.head});
  final String lottiePath;
  final String head;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.width * .35,
          child: Lottie.asset(lottiePath),
        ),
        Text(
          head,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
