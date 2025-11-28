import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
    final Map<String, List<String>> shoppingList = {
      'Fruttivendolo':['Mele','Pere','Banane','Ananas'],
      'Panificio':['Panini','Pizza','Focaccia'],
      'Macelleria':['Braciole','Salsiccie','Arrosticini']

    };
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: shoppingList.length,
          itemBuilder: (context, index){
            String category = shoppingList.keys.elementAt(index);
            List<String> items = shoppingList[category] ?? [];
            int num = items.length;
            return ListTile(
              leading: Icon(Icons.accessible_forward_rounded),
              title: Text(category),
              subtitle: Text('items: $num'),
              trailing: Icon(Icons.arrow_right_sharp),
            );
          },
        ),
      ),
    );
  }
}


