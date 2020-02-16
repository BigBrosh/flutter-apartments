import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function action;

  PrimaryButton(this.title, this.action);

  @override
  Widget build(BuildContext context) {
    return (
        RaisedButton(
            child: Text(title),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: action
        )
    );
  }
}