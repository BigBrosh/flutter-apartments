import 'package:hive/hive.dart';

final searchRequestsKey = 'searchRequests';
final searchRequestsBox = Hive.box(searchRequestsKey);

final requestFromSearch = 'requestFromSearch';