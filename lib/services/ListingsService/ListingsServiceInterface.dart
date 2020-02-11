abstract class ListingsServiceInterface {
  Future<List<dynamic>> getBySearchValue(String searchValue);
}