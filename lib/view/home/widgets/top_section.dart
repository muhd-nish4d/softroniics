import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .45,
      color: Colors.lightBlue[700],
      child: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Container(
            margin: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/aware.png'))),
          )),
          const Expanded(
              child: Text(
            'Avoi the\nscare of\ncoronavirus',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ))
        ],
      )),
    );
  }
}
