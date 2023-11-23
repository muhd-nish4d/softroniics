import 'package:flutter/material.dart';
import 'package:softroniics/helpers/const/const.dart';

class SymptomsSection extends StatelessWidget {
  const SymptomsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}