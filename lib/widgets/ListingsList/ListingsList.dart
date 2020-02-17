import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nestoria_appartments/views/HomePage/HomePage.dart';
import 'package:nestoria_appartments/widgets/Listing/Listing.dart';

class ListingsList extends StatelessWidget {
  Widget renderListings() {
    if (listings.list.isEmpty) {
      return SizedBox.shrink();
    }

    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: listings.list.length,
        itemBuilder: (_, index) => new Listing(listings.list[index]),
        separatorBuilder: (_, index) => SizedBox(height: 10)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return renderListings();
      }
    );
  }
}