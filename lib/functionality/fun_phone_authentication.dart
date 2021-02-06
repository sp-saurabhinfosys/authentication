import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  static String route = "MyLogin";

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;




  String phoneNumber, verificationId;
  String otp, authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      timeout: const Duration(seconds: 20),
      verificationCompleted: (AuthCredential authCredential) {
        FirebaseAuth.instance.signInWithCredential(authCredential).then((value) async {
          if(value.user!=null && value.user.uid!=null){

          }
        });

      },
      verificationFailed: (authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, [int forceCodeResent]) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  otp = value;

                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  signIn(otp);
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ))
        .then((value) async {

      print("User Logged");

    }).catchError((onError) {
      if (onError != null && onError.message != null) {
        print(onError.message);

      }
    });
  }



  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  TextField(

                    keyboardType: TextInputType.phone,
              controller: phoneController,

                    onChanged: (v) {
                      phoneNumber = v;
                    },

                  ),

                  RaisedButton(
                      child: Text("Get OTP"),
                      onPressed: () {
                        print(phoneNumber);
                        verifyPhoneNumber(context);

                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




}
