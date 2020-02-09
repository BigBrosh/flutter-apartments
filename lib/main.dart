import 'package:flutter/material.dart';
import 'package:nestoria_appartments/initializations/hiveInitialization.dart';
import 'views/SearchPage/SearchPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchPage(),
    );
  }
}
