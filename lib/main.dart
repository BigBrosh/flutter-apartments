import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'views/SearchPage/SearchPage.dart';
import 'hiveBoxes/formBox.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  await Hive.openBox(apartmentSearchKey);

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
