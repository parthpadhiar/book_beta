import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseApp app = FirebaseApp.configure(
    name: 'request',
    options: const FirebaseOptions(
      googleAppID: '1:353479927206:android:1a9f469d98e15719951b67',
      apiKey: 'AIzaSyB-R9eGVgmr_e7-xZeaJwY3o4-sA44FtCw',
      databaseURL: 'https://bookbeta-d828d.firebaseio.com/',
    )) as FirebaseApp;

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    item = Item("", "", "");
    itemRef = FirebaseDatabase.instance.reference().child('items');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildAdded.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.deepOrange,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                  key: formKey,
                  child: Center(
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset('assets/images/book2.jpg')),
                            Text("Request your favorite")
                          ],
                        ),
                        ListTile(
                          title: TextFormField(
                            initialValue: "",
                            validator: (value) => value == "" ? value : null,
                            onSaved: (value) => item.userName = value,
                            decoration: InputDecoration(
                                hintText: 'Enter Your name',
                                labelText: 'Your Name',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ))),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            validator: (value) => value == "" ? value : null,
                            onSaved: (value) => item.bookTitle = value,
                            initialValue: "",
                            decoration: InputDecoration(
                                hintText: 'Enter Book name',
                                labelText: 'Book Name',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ))),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            validator: (value) => value == "" ? value : null,
                            onSaved: (value) => item.autherName = value,
                            initialValue: "",
                            decoration: InputDecoration(
                                hintText: 'Enter Authers name',
                                labelText: 'Auther Name',
                                labelStyle: TextStyle(color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ))),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: RaisedButton(
                              color: Colors.black,
                              child: Text(
                                "Submit",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.deepOrange)),
                              onPressed: () {
                                handleSubmit();
                              }),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String key;
  String userName;
  String bookTitle;
  String autherName;

  Item(this.userName, this.bookTitle, this.autherName);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        userName = snapshot.value["userName"],
        bookTitle = snapshot.value["bookTitle"],
        autherName = snapshot.value["autherName"];
  toJson() {
    return {
      "userName": userName,
      "bookTitle": bookTitle,
      "autherName": autherName,
    };
  }
}
