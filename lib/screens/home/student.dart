// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tutor_media/screens/home/widgets/S_home_app_bar.dart';
import 'package:tutor_media/screens/home/widgets/s_search_card.dart';
import 'package:tutor_media/screens/home/widgets/s_tuition_list.dart';
import 'package:tutor_media/screens/home/widgets/tag_list.dart';

import '../Welcome/welcome_screen.dart';

class StuHomePage extends StatelessWidget {
  List<Text> text = [
    Text(
      'Profile',
    ),
    Text(
      'Home',
    ),
    Text('Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent.withOpacity(0.3),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StuHomeAppBar(),
              StuSearchCard(),
              TagList(),
              StuTuitionList(),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 10,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
        },
        child: Icon(
          Icons.home,
          color: Colors.red,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Text(''),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
