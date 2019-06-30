import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_moor/modele/persistence.dart';
import 'package:demo_moor/screens/todo_new.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Moor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo Moor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _newTodo() {
    Navigator.of(context).
      push(MaterialPageRoute(
        builder: (context) => TodoNew(),
        fullscreenDialog: true
      )
    );
  }

  void _onItemCheck(Todo item, bool checked) {
    setState(() {
      // update la valeur dans la base de données
      Database.get().insert(item.copyWith(checked: checked));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: Database.get().allTodos,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return new Center(
              child: CircularProgressIndicator(),
            );
          List<Todo> todos = snapshot.data;
          if (todos.isEmpty)
            return new Center(
              child: Text(
                "Aucune entrée",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
            );
          else return ListView.separated(
            itemBuilder: (context, index) =>
              ListTile(
                title: Text(todos[index].content),
                leading: Checkbox(
                  value: todos[index].checked,
                  onChanged: (bool) => _onItemCheck(todos[index], bool),
                ),
              ),
            separatorBuilder: (context, index) =>
              Divider(
                color: Colors.grey[400],
                height: 1.0,
              ),
            itemCount: todos.length
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newTodo,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
