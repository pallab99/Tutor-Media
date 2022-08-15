// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:tutor_media/models/data['']dart';
import 'package:tutor_media/widgets/icon_text.dart';

class TuitionItem extends StatefulWidget {
  // final Tuition data;
  // TuitionItem(this.data);
  String className, title, location, time, studentName;
  bool isMark;

  TuitionItem(
      {required this.studentName,
      required this.className,
      required this.title,
      required this.location,
      required this.isMark,
      required this.time});

  @override
  State<TuitionItem> createState() => _TuitionItemState();
}

class _TuitionItemState extends State<TuitionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text('Hi, ${widget.studentName}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Class ${widget.className}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              IconButton(
                icon: Icon(widget.isMark
                    ? Icons.bookmark
                    : Icons.bookmark_outline_outlined),
                onPressed: () {
                  setState(() {
                    widget.isMark = !widget.isMark;
                  });
                },
                color: widget.isMark
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                Icons.location_on_outlined,
                widget.location,
              ),
              IconText(Icons.access_time_outlined, widget.time),
            ],
          )
        ],
      ),
    );
  }
}
