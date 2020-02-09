import 'package:flutter/material.dart';

String title = "Use the form below to search for houses to buy. You can search by place-name, postcode, or click 'My location', to search in your current location!";

class SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        Text(
            title,
            textAlign: TextAlign.start
        )
      ],
    );
  }
}
