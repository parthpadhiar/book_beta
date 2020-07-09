import 'package:book_beta/yourbook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:book_beta/request.dart';
import 'package:book_beta/uploadbook.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return YourBook();
        break;
      case 1:
        return UploadBook();
        break;
      case 2:
        return RequestPage();
        break;
      case 3:
        return RequestPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.deepOrange,
        buttonBackgroundColor: Colors.black,
        height: 47,
        items: <Widget>[
          Icon(
            Icons.bookmark_border,
            size: 20,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.book,
            size: 20,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.cloud_upload,
            size: 20,
            color: Colors.deepOrange,
          ),
          Icon(
            Icons.feedback,
            size: 20,
            color: Colors.deepOrange,
          ),
        ],
        animationDuration: Duration(milliseconds: 150),
        index: 2,
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
