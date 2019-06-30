import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_moor/modele/persistence.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoNew extends StatefulWidget {
  @override
  _TodoNewState createState() => _TodoNewState();
}

class _TodoNewState extends State<TodoNew> {
  TextEditingController _controller;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  void _onNewItem(BuildContext context) {
    if (_controller.text.isEmpty) {
      setState(() {
        showError = true;
      });
    } else {
      Database.get().insert(
          new Todo(
              content: _controller.text,
              checked: false
          )
      );
      Fluttertoast.showToast(
          msg: "Nouveau todo créé",
          fontSize: 12.0,
          toastLength: Toast.LENGTH_SHORT
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _onNewItem(context),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Contenu du Todo",
            errorText: showError ? "Entrez un texte correct" : null
          ),
        ),
      ),
    );
  }
}
