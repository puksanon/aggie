import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: SpinKitRing(
            lineWidth: 3,
            color: Theme.of(context).textTheme.caption.color,
            size: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'loading',
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
