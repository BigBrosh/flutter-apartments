import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:nestoria_appartments/models/SearchRequestM.dart';

class SearchRequestA extends TypeAdapter<SearchRequestM> {
  @override
  SearchRequestM read(BinaryReader reader) {
    return SearchRequestM.fromJson(json.decode(reader.readString()));
  }

  @override
  void write(BinaryWriter writer, SearchRequestM request) {
    writer.writeString(json.encode(request.toJson()));
  }

  @override
  int get typeId => 33;
}