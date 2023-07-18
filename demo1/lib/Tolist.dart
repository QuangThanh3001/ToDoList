import 'package:flutter/material.dart';
import 'modal/item.dart';
import 'widget/card_body.dart';
import 'widget/card_body_button.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyappTolist(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 226, 223, 215),
    ),
  ));
}

class MyappTolist extends StatefulWidget {
  MyappTolist({Key? key}) : super(key: key);

  @override
  State<MyappTolist> createState() => _MyappTolistState();
}

class _MyappTolistState extends State<MyappTolist> {
  final List<DataItems> items = [ ];

  void _handAddTask(String name){
     final newItem = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
       items.add(newItem);
    });
  }
void _handDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
}
  @override
  Widget build(BuildContext context) {
    print('da Run');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text(
            'ToDoList',
            style: TextStyle(
              fontSize: 30,
              color: Colors.pink,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Column(
              children: items.map((item) =>  CardBody(
                index :items.indexOf(item),
                item : item, 
                handDelete: _handDeleteTask )).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) =>  ModalBotton(
              addTask : _handAddTask
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Color.fromARGB(255, 226, 24, 189),
        ),
      ),
    );
  }
}
