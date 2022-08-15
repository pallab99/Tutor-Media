import 'package:flutter/material.dart';
import 'package:tutor_media/models/tuition.dart';
import 'package:tutor_media/widgets/icon_text.dart';

class TuitionDetail extends StatefulWidget {
  String className, title, location, time, studentName;
  bool isMark;
  TuitionDetail({
    super.key,
    required this.studentName,
    required this.className,
    required this.title,
    required this.location,
    required this.time,
    required this.isMark,
  });

  @override
  State<TuitionDetail> createState() => _TuitionDetailState();
}

class _TuitionDetailState extends State<TuitionDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Text('Hi, ${widget.studentName}'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.className,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isMark = !widget.isMark;
                          });
                        },
                        icon: Icon(
                          widget.isMark
                              ? Icons.bookmark
                              : Icons.bookmark_outline_rounded,
                          color: widget.isMark
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        )),
                    Icon(Icons.more_horiz_outlined),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(Icons.location_on_outlined, widget.location),
                IconText(Icons.access_time_filled_outlined, widget.time),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Additional Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // ...tuition.req
            //     .map((e) => Container(
            //           margin: EdgeInsets.symmetric(vertical: 5),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 30),
            //                 height: 5,
            //                 width: 5,
            //                 decoration: BoxDecoration(
            //                     shape: BoxShape.circle, color: Colors.black),
            //               ),
            //               SizedBox(
            //                 width: 10,
            //               ),
            //               ConstrainedBox(
            //                 constraints: BoxConstraints(
            //                   maxWidth: 300,
            //                 ),
            //                 child: Text(
            //                   e,
            //                   style: TextStyle(
            //                     wordSpacing: 2,
            //                     height: 3.0,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ))
            //     .toList(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              height: 45,
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  final snackbar = SnackBar(
                    content:
                        const Text("Your request will be monitored shortly"),
                    duration: const Duration(seconds: 3),
                    action: SnackBarAction(
                        label: "OK",
                        onPressed: () => Navigator.of(context).pop(),
                        textColor: Colors.yellow),
                  );
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: const Text('Request Now'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
