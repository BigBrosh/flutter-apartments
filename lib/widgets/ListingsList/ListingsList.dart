import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/controllers/PaginationController/PaginationController.dart';
import 'package:nestoria_appartments/stores/ListingsStore/ListingsStore.dart';
import 'package:nestoria_appartments/widgets/Listing/Listing.dart';
import 'package:provider/provider.dart';

class ListingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListingsStore>(
        builder: (context, listings, child) {
          return Observer(
            builder: (_) {
              if (listings.list.isEmpty) {
                return SizedBox.shrink();
              }

              return RefreshIndicator(
                onRefresh: listings.refresh,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  itemCount: listings.list.length,
                  itemBuilder: (_, index) => new Listing(listings.list[index]),
                  separatorBuilder: (_, index) => SizedBox(height: 10),
                  controller: new PaginationController(listings).scrollController,
                ),
              );
            }
          );
        }
    );
  }
}