import 'package:flutter/widgets.dart';
import 'package:nestoria_appartments/interfaces/PaginationServiceI.dart';

class PaginationController {
  int page = 1;
  final ScrollController _scrollController = new ScrollController();

  PaginationController(PaginationServiceI service) {
    _scrollController.addListener(() {
      double pixels = _scrollController.position.pixels;
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (pixels == maxScrollExtent && page <= service.maxPages) {
        service.fetchByPage(++page);
      }
    });
  }

  get scrollController => _scrollController;
}