import 'package:flutter/material.dart';

import '../../../Components/spacers.dart';
import '../../../Declarations/Constants/constants.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBtn("Sign in with Facebook", Colors.blue, Icons.facebook),
        const WidthSpacer(myWidth: 15.5),
        buildBtn("Sign in with Gmail", Colors.red, Icons.mail)
      ],
    );
  }

  Widget buildBtn(String text, Color btnColor, IconData iconData) => Container(
        width: 192,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const WidthSpacer(myWidth: 7.00),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
