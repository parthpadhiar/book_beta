import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadBookPage extends StatefulWidget {
  @override
  _DownloadBookPageState createState() => _DownloadBookPageState();
}

class _DownloadBookPageState extends State<DownloadBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Download Book",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("Download Book"),
      ),
    );
  }
}
