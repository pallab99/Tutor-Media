// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tutor_media/models/tuition.dart';
import 'package:tutor_media/screens/home/widgets/tuition_detail.dart';
import 'package:tutor_media/screens/home/widgets/tuition_item.dart';

class TuitionList extends StatefulWidget {
  @override
  State<TuitionList> createState() => _TuitionListState();
}

class _TuitionListState extends State<TuitionList> {
  // final tuitionList = Tuition();
  Stream<QuerySnapshot>? fetchedData;
  final Stream<QuerySnapshot> dataStream =
      FirebaseFirestore.instance.collection('/users').snapshots();
  @override
  void initState() {
    // TODO: implement initState
    fetchedData = dataStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      height: 160,
      child: StreamBuilder<QuerySnapshot?>(
        stream: fetchedData,
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (snapshot.hasError) {
            const Text("Something is wrong");
          } else {
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              final data = snapshot.data!.docs;
              final count = data.length;
              return ListView.separated(
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                }),
                itemCount: count,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recivedData = data[index];
                  return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => TuitionDetail(
                                  studentName: recivedData['name'],
                                  className: recivedData['class'],
                                  isMark: recivedData['isMark'],
                                  location: recivedData['location'],
                                  time: recivedData['time'],
                                  title: recivedData['subject'],
                                ));
                      },
                      child: TuitionItem(
                        studentName: recivedData['name'],
                        className: recivedData['class'],
                        isMark: recivedData['isMark'],
                        location: recivedData['location'],
                        time: recivedData['time'],
                        title: recivedData['subject'],
                      ));
                },
                // separatorBuilder: (BuildContext context, int index) {
                //   return SizedBox(
                //     width: 15,
                //   );
                // },

                //   GestureDetector(
                //       onTap: () {
                //         showModalBottomSheet(
                //             backgroundColor: Colors.transparent,
                //             isScrollControlled: true,
                //             context: context,
                //             builder: (context) =>
                //                 TuitionDetail());
                //       },
                //       child: TuitionItem('')
                //       ),
                //   separatorBuilder: (_, index) => SizedBox(
                //     width: 15,
                //   ),
                // );
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
          return const Text("Loading");
        },
      ),
    );
  }
}
