import 'package:flutter/material.dart';
import 'package:softroniics/helpers/const/const.dart';
import 'package:softroniics/view/home/widgets/guid_section.dart';
import 'package:softroniics/view/home/widgets/symptoms_seciton.dart';
import 'package:softroniics/view/home/widgets/top_section.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopSection(),
        Padding(
          padding: EdgeInsets.only(top: 15, left: 15),
          child: Text('Symptoms', style: normalTextStyle),
        ),
        SymptomsSection(),
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Emergency Guide',
            style: normalTextStyle,
          ),
        ),
        GuidSection()
      ],
    ));
  }
}