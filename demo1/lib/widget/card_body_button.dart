import 'package:flutter/material.dart';

class ModalBotton extends StatelessWidget {
   ModalBotton({
    Key? key,
    required this.addTask
  }): super(key: key);
final Function addTask;
  String textValue ='';
void _handleOnclick(BuildContext context){
  final name = textValue;
  if (name.isEmpty) {
    return;
  }
  addTask(name);
  Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),

       child: Column(
         children: [
           TextField(
            onChanged: (text) => textValue=text ,
           decoration:const InputDecoration(
             border: OutlineInputBorder(),
             labelText:'Task Name',

           ),
          ),
          const SizedBox(height: 20,),
           SizedBox(
             width: double.infinity,
             height: 50,
             child: ElevatedButton(
              onPressed:(()=>_handleOnclick(context))  , 
             child: const Text('Add Task')),
           )
         ],
       ),
                ),
    );
  }
}

