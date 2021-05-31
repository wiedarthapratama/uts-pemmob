import 'package:flutter/material.dart';
import 'package:uts_pemmob/sign_in/sign_in.dart';
import 'package:uts_pemmob/widget/default_button.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: null,
        child: Column(
          children: [
            Row(
              children: [
                // SvgPicture.asset(
                //   icon,
                //   color: MyColors.appPrimaryColor,
                //   width: 22,
                // ),
                Expanded(
                    child: Text(
                  "NIM",
                  style: TextStyle(fontSize: 20),
                )),
                Icon(Icons.vpn_key),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "NAMA",
                  style: TextStyle(fontSize: 20),
                )),
                Icon(Icons.person),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "EMAIL",
                  style: TextStyle(fontSize: 20),
                )),
                Icon(Icons.email),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DefaultButton(
              text: "Logout",
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
