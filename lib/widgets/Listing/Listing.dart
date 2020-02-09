import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/models/Listing.dart';

class Listing extends StatelessWidget {
  final ListingModel listing;

  Listing(this.listing);

  Widget listingImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
          listing.thumbUrl,
          height: 80,
          width: 80,
          fit: BoxFit.cover
      )
    );
  }

  Widget listingInformation() {
    return Flexible(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${listing.priceFormatted}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8,),
            Text(
              '${listing.title}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            listingImage(),
            SizedBox(width: 16),
            listingInformation()
          ],
        ),
      ),
    );
  }
}