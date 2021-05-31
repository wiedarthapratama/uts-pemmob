// Project imports:

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.loading,
    this.width,
  }) : super(key: key);
  final String text;
  final Function press;
  final bool loading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 48,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.red,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
