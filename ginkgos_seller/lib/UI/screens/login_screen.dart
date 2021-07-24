import 'package:flutter/material.dart';
import 'package:ginkgos_seller/UI/constant/color.dart';
import 'package:ginkgos_seller/UI/constant/inputdeco.dart';

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
                                    keyboardType: TextInputType.phone,
                                    controller: _email,
                                    validator: (value) {
                                      if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value!)) {
                                        return 'Invalid Email';
                                      }
                                    },
                                    autofocus: true,
                                    maxLength: 10,
                                    decoration: kTextInputDeco.copyWith(
                                        hintText: 'Email',
                                        counterText: '',
                                        prefixIcon: Icon(Icons.phone))),
                                TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _password,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Enter Password';
                                      }
                                    },
                                    obscureText: true,
                                    autofocus: true,
                                    maxLength: 10,
                                    decoration: kTextInputDeco.copyWith(
                                        hintText: 'Password',
                                        counterText: '',
                                        prefixIcon: Icon(Icons.phone))),
                                SizedBox(height: 10),
                                Material(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: MaterialButton(
                                        onPressed: () {
                                          _formKey.currentState!.validate();
                                        },
                                        child: Text('LogIN',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600))))
                              ]))))
            ]))));
  }
}
