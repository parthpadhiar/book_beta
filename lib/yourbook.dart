import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourBook extends StatefulWidget {
  @override
  _YourBookState createState() => _YourBookState();
}

class _YourBookState extends State<YourBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YourBooks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("YourBooks"),
      ),
    );
  }
}
