// Project imports:
import 'package:flutter/material.dart';

import 'sign_in_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 150, right: 50, left: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5 * 5.5),
              Text(
                "SIGN IN",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              SignForm(),
              SizedBox(height: 50),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
