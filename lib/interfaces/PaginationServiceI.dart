abstract class PaginationServiceI {
  int maxPages;
  Future fetchByPage(int page);
}