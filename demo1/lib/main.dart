import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
         children :[ Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxMethod('Box 1', Alignment.bottomRight),
                    
                    boxMethod('Box 2', Alignment.bottomLeft),
                ],
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    boxMethod('Box 3', Alignment.topRight),
                    
                     boxMethod('Box 4', Alignment.topLeft),
                ],
              ),
            ],
          ),
          Center(
            child: boxMethod(
              'Hello Word', 
              Alignment.center,
              true
              )
            )
         ],
        ),
    ),
    debugShowCheckedModeBanner: false,
    );
  }

  Container boxMethod(String name, Alignment direction, [bool boxR = false]) {
    return Container(      
      decoration: BoxDecoration(
        color: boxR ?Colors.blue  : Colors.green,
        borderRadius: BorderRadius.circular(boxR ? 100 : 0)),     
                alignment: direction,
                height: 160,
                width: 160,
              
                child:  Text(
                  name,
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 30
                  ),
                  ),
              );
  }
}