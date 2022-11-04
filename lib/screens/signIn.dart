import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:signin/HomeScree.dart';
import 'package:signin/screens/gmail.dart';
import 'package:signin/screens/gmail.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int start = 60;
  String _mobile;
  String phone;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => News()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

 

  void otp() {
    _auth.verifyPhoneNumber(
        phoneNumber: "+91" + phoneController.text,
        verificationCompleted: (PhoneAuthCredential) async {
          setState(() {
            showLoading = false;
          });
        },
        verificationFailed: (verificationFailed) async {
          setState(() {
            showLoading = false;
          });
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text("Error")));
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            showLoading = false;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (VerificationId) async {});
  }

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  getMobilFormWidget(context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/bg.jpg",
                ),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(50, 100, 0, 50),
          child: FadeInDown(
            delay: Duration(milliseconds: 500),
            child: Text(
              "Welcome!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: 450.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 16.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  )
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: FadeInDown(
                delay: Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Mobile Verification",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.purpleAccent[100],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown[200],
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.brown[200]),
                              child: TextFormField(
                                validator: (input) {
                                  if (input.length != 10)
                                    return 'Invalid Phone Number';
                                },
                                // onSaved: (input) => _email = input,
                                controller: phoneController,
                                decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 200,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            child: Container(
                              height: 50.0,
                              width: 100.0,
                              child: Center(
                                child: Text(
                                  "Send OTP",
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: 'Ubuntu'),
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent[100],
                              onSurface: Colors.white,
                              shadowColor: Colors.pinkAccent,
                              elevation: 20.0,
                              animationDuration: Duration(milliseconds: 200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                showLoading = true;
                              });
                              // startTimer();
                              await _auth.verifyPhoneNumber(
                                  phoneNumber: "+91" + phoneController.text,
                                  verificationCompleted:
                                      (PhoneAuthCredential) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                  },
                                  verificationFailed:
                                      (verificationFailed) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Invalid Credentials")));
                                  },
                                  codeSent:
                                      (verificationId, resendingToken) async {
                                    setState(() {
                                      showLoading = false;
                                      currentState = MobileVerificationState
                                          .SHOW_OTP_FORM_STATE;
                                      this.verificationId = verificationId;
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (VerificationId) async {});
                            },
                            // onPressed: () {
                            //   navigatetoNewsgromSinIN();
                            //   auth.signInWithEmailAndPassword(
                            //       email: _email, password: _password);
                            //   Navigator.of(context).pushReplacement(
                            //       MaterialPageRoute(
                            //           builder: (context) => News()));
                            // },
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmailLogin()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.purpleAccent.shade100,
                                    width: 2),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign in With your E-Mail",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

       

  getOtpFormWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      child: FadeInDown(
        delay: Duration(milliseconds: 500),
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown[200]),
              child: TextFormField(
                // onSaved: (input) => _email = input,
                controller: otpController,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: Container(
                height: 50.0,
                width: 100.0,
                child: Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(fontSize: 18.0, fontFamily: 'Ubuntu'),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent[100],
                onSurface: Colors.white,
                shadowColor: Colors.pinkAccent,
                elevation: 20.0,
                animationDuration: Duration(milliseconds: 200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: otpController.text);

                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
            
            ),
            Spacer(),
          ],
        ),
      ),
    );
   
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobilFormWidget(context)
                  : getOtpFormWidget(context)),
    );
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
}
