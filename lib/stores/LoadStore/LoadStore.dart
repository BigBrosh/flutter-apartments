import 'package:mobx/mobx.dart';
part 'LoadStore.g.dart';

class LoadStore = _LoadStore with _$LoadStore;

abstract class _LoadStore with Store {
  int loadCount = 0;

  @observable
  bool isLoading = false;

  @action
  void loadingOn() {
    ++loadCount;
    isLoading = true;
  }

  @action
  void loadingOff() {
    int newCount = loadCount - 1;
    loadCount = newCount >= 0 ? newCount : 0;
    isLoading = loadCount > 0;
  }
}