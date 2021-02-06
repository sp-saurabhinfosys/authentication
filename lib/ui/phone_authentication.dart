import 'package:flutter/material.dart';
import 'package:authentication/functionality/fun_phone_authentication.dart';
class PhoneAuthentication extends StatefulWidget {
  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

              ),
            ),
          )),
          RaisedButton(onPressed: () async {

          })
        ],
      ),
    );
  }
}
