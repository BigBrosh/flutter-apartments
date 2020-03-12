import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nestoria_appartments/models/Listing.dart';

class ListingPage extends StatelessWidget {
  Widget listingImage(BuildContext context, String url, String id) {
    return Hero(
      tag: id,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4)
          ),
          child: Image.network(
              url,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ListingModel listing = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(listing.title)),
        body: Column(
            children: <Widget>[
              listingImage(context, listing.imgUrl, listing.listerUrl),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 8,
                  children: <Widget>[
                    Text(
                      '${listing.priceFormatted}',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    Text(listing.summary)
                  ]
                )
              )
            ]
        )
    );
  }
}
