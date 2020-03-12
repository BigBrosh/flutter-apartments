import 'package:hive/hive.dart';
import 'package:nestoria_appartments/libs/hive/hiveAdapters/SearchRequestA/SearchRequestA.dart';
import 'package:nestoria_appartments/libs/hive/hiveBoxes/hiveBoxes.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future initHive() async {
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SearchRequestA());
  await Future.wait(hiveBoxes.map((hiveBox) => Hive.openBox(hiveBox)));
}