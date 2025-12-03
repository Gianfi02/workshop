

import 'dart:ffi';

import 'package:flutter/material.dart';

class ListDetailPage extends StatelessWidget{
  final String title;
  final List<String> items;

  const ListDetailPage({
    super.key,
    required this.title,
    required this.items,
  });


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Counter(title: items[index]),

        ),
      ),

    );
  }
}

class Counter extends StatefulWidget{
  final String title;
  int contatore = 0;
  
  const Counter({super.key, required this.title});


  @override
  Widget build(BuildContext content){
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Icon(Icons.remove),
            Text('$contatore'),
            Icon(Icons.add),
          ], 
        
        )
        ),
      );
    
  }
}