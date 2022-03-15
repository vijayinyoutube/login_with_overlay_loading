import 'package:flutter/material.dart';

import 'spacers.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        WidthSpacer(myWidth: 25.50),
        Text("Loading..."),
      ]);
  }
}

      