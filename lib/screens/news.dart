import 'dart:convert';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signin/subscreens/covid.dart';
import 'package:signin/subscreens/mainDrawer.dart';
import 'package:signin/subscreens/sportsPage.dart';
import 'package:signin/subscreens/technology.dart';
import 'package:signin/subscreens/worldNews.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var api =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=4c083b721ebc485fabce34fe16ca5404";
  var res, im, data;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  fetchNewsData() async {
    res = await http.get(Uri.parse(api));
    data = jsonDecode(res.body)["articles"];
    print(data.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MainDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        elevation: 10.0,
        shadowColor: Colors.purpleAccent,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(children: [
              Text(
                "My",
                style: TextStyle(
                  fontFamily: 'font/Poppins-Thin',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
              Text(
                "News",
                style: TextStyle(
                  fontFamily: 'font/Poppins-Thin',
                  fontSize: 25.0,
                  color: Colors.purpleAccent,
                ),
              ),
            ]),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        color: Color(0xffF3E5F5),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              child: FadeInLeft(
                delay: Duration(milliseconds: 300),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorldNews()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.purpleAccent.shade100,
                                      width: 2),
                                  color: Colors.transparent),
                              margin: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 5),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 35.0,
                              child: Center(
                                  child: Text(
                                "World",
                                style: TextStyle(color: Colors.purpleAccent),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sports()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.purpleAccent.shade100,
                                      width: 2),
                                  color: Colors.transparent),
                              margin: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 5),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 35.0,
                              child: Center(
                                  child: Text(
                                "Sports",
                                style: TextStyle(color: Colors.purpleAccent),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Techno()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.purpleAccent.shade100,
                                      width: 2),
                                  color: Colors.transparent),
                              margin: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 5),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 35.0,
                              child: Center(
                                  child: Text(
                                "Technology",
                                style: TextStyle(color: Colors.purpleAccent),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndiaData()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.purpleAccent.shade100,
                                      width: 2),
                                  color: Colors.transparent),
                              margin: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 5),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 35.0,
                              child: Center(
                                  child: Text(
                                "Covid",
                                style: TextStyle(color: Colors.purpleAccent),
                              )),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Expanded(
              child: Center(
                child: res != null
                    ? InkWell(
                        // onTap: ,
                        child: ListView.builder(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.length - 1,
                          itemBuilder: (context, index) {
                            var state = data[index];
                            return FadeInDown(
                              delay: Duration(milliseconds: 200),
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Image.network(
                                                  "${state["urlToImage"]}",
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace stackTrace) {
                                                    return Image.asset(
                                                        'assets/no.jpg');
                                                  },
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                "${state["title"]}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0),
                                              ),
                                              Text(
                                                "${state["description"]}",
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                softWrap: false,
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${state["publishedAt"]}"
                                                        .substring(0, 10),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    style: TextStyle(
                                                        color: Colors.black26,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      var url =
                                                          "${state["url"]}";

                                                      if (await canLaunch(
                                                          url)) {
                                                        await launch(url,
                                                            forceSafariVC: true,
                                                            forceWebView: true);
                                                      } else {
                                                        throw Container(
                                                          child: Text(
                                                            "Could not load page",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 24.0),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    child: Text(
                                                      "Read More",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
