import 'package:flutter/material.dart';
import 'package:signin/screens/news.dart';
import 'package:signin/screens/signIn.dart';
import 'package:signin/subscreens/Info.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.purpleAccent,
              Colors.purpleAccent[100]
            ])),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: NetworkImage(
                    //       "https://upload.wikimedia.org/wikipedia/en/thumb/8/86/Integral_University%2C_Lucknow_logo.png/220px-Integral_University%2C_Lucknow_logo.png",
                    //     ),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                  ),
                  Row(children: [
                    Text(
                      "My",
                      style: TextStyle(
                        fontFamily: 'font/Poppins-Thin',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                        fontFamily: 'font/Poppins-Thin',
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => News()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Developers',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Info()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
    );
  }
}
