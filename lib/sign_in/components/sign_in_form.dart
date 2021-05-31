// Flutter imports:
import 'package:flutter/material.dart';
import 'package:uts_pemmob/profile/profile.dart';
import 'package:uts_pemmob/sign_up/sign_up.dart';
import 'package:uts_pemmob/widget/default_button.dart';

// Project imports:

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String password;
  bool remember = false;
  bool isLoading = false;
  final List<String> errors = [];

  bool obSecurePassword = true;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void _showLoading() {
    setState(() => isLoading = true);
  }

  void _dismissLoading() {
    setState(() => isLoading = false);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 20),
          buildPasswordFormField(),
          SizedBox(height: 20),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     // Checkbox(
          //     //   value: remember,
          //     //   activeColor: MyColors.appPrimaryColor,
          //     //   onChanged: (value) {
          //     //     setState(() {
          //     //       remember = value;
          //     //     });
          //     //   },
          //     // ),
          //     // Text("Remember me"),
          //     // Spacer(),
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
          //       child: GestureDetector(
          //         onTap: () => Get.toNamed(ForgotPasswordScreen.routeName),
          //         child: Text(
          //           "FORGOT_PASSWORD".tr,
          //           style: TextStyle(decoration: TextDecoration.underline),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          // FormError(errors: errors),
          // SizedBox(height: getProportionateScreenHeight(20)),

          isLoading
              ? Column(
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(height: 40),
                    Container(),
                  ],
                ),
          DefaultButton(
            text: "Login",
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Belum punya akun?'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: obSecurePassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          child: obSecurePassword
              ? Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20,
                    20,
                    20,
                  ),
                  child: Icon(
                    Icons.lock,
                    color: Colors.black45,
                  ))
              : Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20,
                    20,
                    20,
                  ),
                  child: Icon(
                    Icons.remove_red_eye,
                    color: Colors.black45,
                  )),
          onTap: () {
            setState(() {
              obSecurePassword = !obSecurePassword;
            });
          },
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "Username",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              20,
              20,
              20,
            ),
            child: Icon(
              Icons.person,
              color: Colors.black45,
            )),
      ),
    );
  }
}
