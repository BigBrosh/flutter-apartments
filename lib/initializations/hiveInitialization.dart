import 'package:hive/hive.dart';
import 'package:nestoria_appartments/hiveBoxes/formBox.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future initHive() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  await Hive.openBox(apartmentSearchKey);
}