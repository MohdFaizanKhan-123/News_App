import 'package:animate_do/animate_do.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin/screens/news.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  void sendOTP() async {
    EmailAuth.sessionName = "Test Session";
    var res = await EmailAuth.sendOtp(
      receiverMail: _emailController.text,
    );
    if (res) {
      SnackBar(content: Text("OTP Sent"));

      print("OTP Sent");
    } else {
      print("We could not sent the otp");
      SnackBar(content: Text("We could not sent the otp"));
    }
  }

  void verifyOTP() {
    var res = EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _otpController.text);
    if (res) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
      print("OTP Verified");
    } else {
      SnackBar(content: Text("Invalid OTP"));
      print("Invalid OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: FadeInDown(
                  delay: Duration(milliseconds: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sign in with E-Mail",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.purpleAccent[100],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.brown[200],
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "E-Mail : ",
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                              border: InputBorder.none,
                              suffixIcon: TextButton(
                                onPressed: () => sendOTP(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Send OTP",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.brown[200],
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown[250]),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _otpController,
                            decoration: InputDecoration(
                              hintText: "OTP : ",
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Colors.white, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => verifyOTP(),
                        child: Container(
                          height: 50.0,
                          width: 100.0,
                          child: Center(
                            child: Text(
                              "Verify OTP",
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
                        // child: Text(
                        //   "Verify OTP",
                        //   style: TextStyle(color: Colors.white, fontSize: 20),
                        // ),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: 50.0, vertical: 12.0),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20)),
                        // color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Text(
          //   "Register with E-Mail",
          //   textAlign: TextAlign.start,
          //   style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(
          //   height: 40.0,
          // ),
          // Column(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.all(16.0),
          //       child: TextField(
          //         controller: _emailController,
          //         decoration: InputDecoration(
          //           hintText: "Enter E-Mail",
          //           labelText: "E-Mail",
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(25.0),
          //             borderSide: BorderSide(
          //               color: Colors.deepPurple,
          //             ),
          //           ),
          //           suffixIcon: TextButton(
          //             onPressed: () => sendOTP(),
          //             child: Text("Send OTP"),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.all(16.0),
          //       child: TextField(
          //         controller: _otpController,
          //         decoration: InputDecoration(
          //           hintText: "Enter OTP",
          //           labelText: "OTP",
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(25.0),
          //             borderSide: BorderSide(
          //               color: Colors.deepPurple,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 20.0,
          // ),
          // FlatButton(
          //   onPressed: () => verifyOTP(),
          //   child: Text(
          //     "Verify OTP",
          //     style: TextStyle(color: Colors.white, fontSize: 20),
          //   ),
          //   padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //   color: Colors.deepPurple,
          // ),
          // Spacer(),
        ],
      ),
    );
  }
}
