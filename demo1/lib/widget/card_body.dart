import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
   CardBody({
Key? key,
required this.item, required this.handDelete, required this.index,
  }) : super(key: key);
var item;
var index;
final Function handDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color:(index%2 == 0) 
        ? const Color.fromARGB(255, 151, 217, 148) 
        : const Color.fromARGB(255, 228, 153, 153),
        borderRadius: BorderRadius.circular(20)
      ),
      width: double.infinity,
      height: 70,
      child:  Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style:const TextStyle(
                color: Color.fromARGB(255, 210, 14, 14),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
           InkWell(
            onTap: () async {
            if (await confirm(context)) {
              handDelete(item.id);
            }
            return;
          },
             child: const Icon(
                Icons.delete_outline,
                size: 25,
                color: Colors.pink,
                ),
           )
          ],
        ),
      ),
    );
  }
}