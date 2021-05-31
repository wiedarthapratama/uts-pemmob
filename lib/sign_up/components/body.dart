// Project imports:
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 150, right: 50, left: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20 * 0.02), // 4%
                Text(
                  "REGISTER ACCOUNT",
                ),
                SizedBox(height: 20 * 0.06),
                SignUpForm(),
                // SizedBox(height: Get.height * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
