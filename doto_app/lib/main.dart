import 'package:doto_app/Controllers/ListTaskController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>ListTaskController(),
        child: MaterialApp(
        home:  MyHomePage(),
       )
    );
  }
}
