import 'package:flutter/material.dart';
import 'package:softroniics/helpers/const/const.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                style: TextStyle(fontSize: 30),
              ))
            ],
          )),
        ),
        Text('Symptoms', style: normalTextStyle),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/images/cold.png'))),
                              )),
                          const Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(top: 40, left: 20),
                                child: Text(
                                  'Cold',
                                  style: normalTextStyle,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.only(top: 40, left: 20),
                                child: Text(
                                  'Cough',
                                  style: normalTextStyle,
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/images/cough.png'))),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          'Emergency Guide',
          style: normalTextStyle,
        ),
        Expanded(
            flex: 4,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Avoi the scare of\ncoronavirus',
                            textAlign: TextAlign.center,
                            style: normalTextStyle),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('call', style: normalTextStyle))
                      ],
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ))
      ],
    ));
  }
}
