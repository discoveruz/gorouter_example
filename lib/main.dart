import 'package:flutter/material.dart';
import 'package:gorouter_example/routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router
        ..addListener(() {
          print('routerConfig: ');
        }),
    );
  }
}
