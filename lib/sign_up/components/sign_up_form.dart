// Flutter imports:
import 'package:flutter/material.dart';
import 'package:uts_pemmob/profile/profile.dart';
import 'package:uts_pemmob/sign_in/sign_in.dart';
import 'package:uts_pemmob/widget/default_button.dart';

// Project imports:

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final nrp = TextEditingController();
  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  String conformPassword;
  bool remember = false;
  bool isLoading = false;

  bool obSecurePassword = true;

  final List<String> errors = [];

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
  void dispose() {
    nrp.dispose();
    nama.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNRPFormField(),
          SizedBox(height: 20),
          buildNameFormField(),
          SizedBox(height: 20),
          buildEmailFormField(),
          SizedBox(height: 20),
          buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(20)),
          // buildConformPassFormField(),
          // FormError(errors: errors),
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
            text: "Register",
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
              Text('Sudah punya akun?'),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
        ],
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
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
              Icons.lock,
              color: Colors.black45,
            )),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: obSecurePassword,
      onSaved: (newValue) => password.text = newValue,
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
                    Icons.remove_red_eye,
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
      onSaved: (newValue) => email.text = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "Email",
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
              Icons.email,
              color: Colors.black45,
            )),
      ),
    );
  }

  TextFormField buildNRPFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => nrp.text = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "NIM",
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

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => nama.text = newValue,
      onChanged: (value) {
        print(value);
      },
      decoration: InputDecoration(
        labelText: "NAME",
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
