// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tutor_media/screens/home/widgets/s_tuition_detail.dart';
import 'package:tutor_media/screens/home/widgets/s_tuition_item.dart';

import '../../../models/s_tuition.dart';

class StuTuitionList extends StatelessWidget {
  final stuitionList = STuition.generateTuition();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      height: 160,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                        StuTuitionDetail(stuitionList[index]));
              },
              child: StuTuitionItem(stuitionList[index])),
          separatorBuilder: (_, index) => SizedBox(
                width: 15,
              ),
          itemCount: stuitionList.length),
    );
  }
}
