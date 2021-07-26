import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/constant/inputdeco.dart';
import 'package:ginkgos_seller/UI/screens/main_screen.dart';
import 'package:ginkgos_seller/UI/widgets/customLoadingBar.dart';
import 'package:ginkgos_seller/UI/widgets/customSnackBar.dart';
import 'package:ginkgos_seller/main.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///To remove focus of text field//
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: SafeArea(
                child: Column(children: [
              ///Logo//
              Expanded(child: Image.asset('images/logo2.png', scale: 3)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _email,
                                    validator: (value) {
                                      if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)) {
                                        return 'Invalid Email';
                                      }
                                    },
                                    autofocus: true,
                                    decoration: kTextInputDeco.copyWith(
                                        hintText: 'Email',
                                        counterText: '',
                                        prefixIcon:
                                            Icon(Icons.email_outlined))),
                                SizedBox(height: 10),
                                TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: _password,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Enter Password';
                                      }
                                    },
                                    obscureText: true,
                                    decoration: kTextInputDeco.copyWith(
                                        hintText: 'Password',
                                        counterText: '',
                                        prefixIcon:
                                            Icon(Icons.vpn_key_outlined))),
                                SizedBox(height: 20),
                                Material(
                                    color: kPrimaryDark,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: MaterialButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            LoadingBar.createLoading(context);
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: _email.text,
                                                    password: _password.text)
                                                .then((value) => {
                                                      Navigator.popAndPushNamed(
                                                          context,
                                                          MainScreen.id,
                                                          arguments:
                                                              ScreenArguments(
                                                                  index: 0))
                                                    })
                                                .catchError((err) {
                                              Navigator.pop(context);
                                              CustomSnackWidgets
                                                  .buildErrorSnackBar(
                                                      context,
                                                      err.hashCode == 185768934
                                                          ? 'Invalid Password'
                                                          : 'Login Failed');
                                            });
                                          }
                                        },
                                        child: Text('Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))))
                              ]))))
            ]))));
  }
}
