import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_list_project/pages/home_page.dart';
import 'package:shopping_list_project/pages/list_detail_page.dart';

void main() {
  runApp(MainApp());
}





class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final GoRouter router = GoRouter(
      routes:[
        GoRoute(path: '/', builder: (context, state) => HomePage()), //definiamo una rotta / che porta a HomePage
        GoRoute(
          path: '/detail',
          builder: (context, state){
            final args = state.extra as Map<String, dynamic>;
            return ListDetailPage(
              title: args['title'],
              items: args['items']
            );
          },
        ),
      ], 
    );
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
    
  }
}

