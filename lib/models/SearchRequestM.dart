import 'package:nestoria_appartments/helpers/parse/parseToInt.dart';

class SearchRequestM {
  String searchValue;
  final int totalResults;

  SearchRequestM.fromJson(Map<String, dynamic> json)
      : searchValue = json["searchValue"],
        totalResults = parseToInt(json["totalResults"]);

  Map<String, dynamic> toJson() =>
      {
        'searchValue': searchValue,
        'totalResults': totalResults
      };
}