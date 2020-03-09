import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/initializations/initDio.dart';
import 'package:nestoria_appartments/services/ListingsService/ListingsService.dart';
import 'package:nestoria_appartments/stores/ListingsStore/ListingsStore.dart';
import 'package:nestoria_appartments/stores/SearchRequestsStore/SearchRequestsStore.dart';
import 'package:nestoria_appartments/views/SearchPage/SearchPage.dart';
import 'package:provider/provider.dart';
import 'initializations/hiveInitialization.dart';
import 'stores/LoadStore/LoadStore.dart';
import 'views/HomePage/HomePage.dart';
import 'widgets/LoadIndicator/LoadIndicator.dart';

final loadStore = new LoadStore();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initDio(loadStore);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue;
    final listingsService = new ListingsService();
    final searchRequests = new SearchRequestsStore();

    return Container(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          MultiProvider(
            providers: [
              Provider<SearchRequestsStore>(create: (context) => searchRequests),
              Provider<ListingsStore>(create: (context) => new ListingsStore(listingsService, searchRequests)),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: primaryColor),
              initialRoute: '/',
              routes: {
                '/': (context) => HomePage(),
                '/search-page': (context) => SearchPage()
              }
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Observer(
                  builder: (_) => LoadIndicator(loadStore.isLoading, primaryColor)
              )
          ),
        ],
      ),
    );
  }
}
