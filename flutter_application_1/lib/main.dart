import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_c.dart';
import 'package:flutter_application_1/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        
        title: 'Flutter Demo',
        
        ),
    );
  }
}
  