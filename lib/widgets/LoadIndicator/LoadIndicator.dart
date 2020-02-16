import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadIndicator extends StatelessWidget {
  final bool isLoading;
  final Color progressColor;

  LoadIndicator(this.isLoading, this.progressColor);

  @override
  Widget build(BuildContext context) {
    if (isLoading == false) {
      return SizedBox.shrink();
    }

    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Container(
            color: Colors.black.withOpacity(0.2),
            child: Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation(progressColor),
                )
            )
        )
    );
  }
}