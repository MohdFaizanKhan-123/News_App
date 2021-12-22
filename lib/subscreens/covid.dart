import 'dart:async';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signin/HomeScree.dart';

class RegionData {
  final int activeCases;
  final int activeCasesNew;
  final int recovered;
  final int recoveredNew;
  final int deaths;
  final int deathsNew;
  final int previousDayTests;
  final int totalCases;
  final String sourceUrl;
  final String lastUpdatedAtApify;
  final String readMe;

  RegionData({
    this.activeCases,
    this.activeCasesNew,
    this.recovered,
    this.recoveredNew,
    this.deaths,
    this.deathsNew,
    this.previousDayTests,
    this.totalCases,
    this.sourceUrl,
    this.lastUpdatedAtApify,
    this.readMe,
  });

  factory RegionData.fromJson(Map<String, dynamic> json) {
    return RegionData(
      activeCases: json['activeCases'],
      activeCasesNew: json['activeCasesNew'],
      recovered: json['recovered'],
      recoveredNew: json['recoveredNew'],
      deaths: json['deaths'],
      deathsNew: json['deathsNew'],
      previousDayTests: json['previousDayTests'],
      totalCases: json['totalCases'],
      sourceUrl: json['sourceUrl'],
      lastUpdatedAtApify: json['lastUpdatedAtApify'],
      readMe: json['readMe'],
    );
  }
}

Future<RegionData> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return RegionData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class IndiaData extends StatefulWidget {
  IndiaData({Key key}) : super(key: key);

  @override
  _IndiaDataState createState() => _IndiaDataState();
}

class _IndiaDataState extends State<IndiaData> {
  Future<RegionData> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => News()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
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
          color: Color(0xffF3E5F5),
          child: Center(
            child: FutureBuilder<RegionData>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FadeInUp(
                        delay: Duration(milliseconds: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              "https://img.freepik.com/free-vector/flat-hand-drawn-doctor-injecting-vaccine-patient_23-2148855954.jpg?size=338&ext=jpg",
                              scale: 2,
                            ),
                            // Container(
                            //   child: Text(
                            //     "Covid Data",
                            //     style: TextStyle(
                            //         color: Colors.purpleAccent,
                            //         fontSize: 45.0,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xffB39DDB),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Today's Cases",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.activeCasesNew
                                                      .toString()
                                                      .substring(1),
                                                  style: TextStyle(
                                                      color: Color(0xff7E57C2),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xff9FA8DA),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Total Cases",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.activeCases
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xff3F51B5),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xff4FC3F7),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Today's Recovery",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.recoveredNew
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xfF01579B),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xff81C784),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Total Recovered",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.recovered
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xff2E7D32),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xffFFB74D),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Today's Death",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.deathsNew
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xffE65100),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                    ),
                                    width: 200.0,
                                    height: 100.0,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 10.0,
                                      color: Color(0xff4DB6AC),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "India",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  "Total Death",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18.0),
                                                ),
                                                Text(
                                                  snapshot.data.deaths
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Color(0xff004D40),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20.0),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.75,
                            //   height: MediaQuery.of(context).size.height * 0.15,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //       color: Colors.purpleAccent[100]),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           "Recovered Cases",
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 17,
                            //               color: Colors.white),
                            //         ),
                            //         Text(
                            //           snapshot.data.recoveredNew.toString(),
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 35,
                            //               color: Colors.white),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.75,
                            //   height: MediaQuery.of(context).size.height * 0.15,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //       color: Colors.purpleAccent[100]),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           "Deaths",
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 17,
                            //               color: Colors.white),
                            //         ),
                            //         Text(
                            //           snapshot.data.deathsNew.toString(),
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 35,
                            //               color: Colors.white),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.75,
                            //   height: MediaQuery.of(context).size.height * 0.15,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20.0),
                            //       color: Colors.purpleAccent[100]),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           "Total Cases",
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 17,
                            //               color: Colors.white),
                            //         ),
                            //         Text(
                            //           snapshot.data.totalCases.toString(),
                            //           textAlign: TextAlign.center,
                            //           style: TextStyle(
                            //               fontFamily: 'font/Poppins-Thin',
                            //               fontSize: 35,
                            //               color: Colors.white),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return SnackBar(content: Text("No Internet Connection"));
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;

// import '../model/indiacases.dart';

// class IndiaData extends StatefulWidget {
//   IndiaData({Key key}) : super(key: key);

//   @override
//   _IndiaDataState createState() => _IndiaDataState();
// }

// class _IndiaDataState extends State<IndiaData> {
//   int _currentIndex = 0;

//   final String url =
//       "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true";

//   Future<IndiaCases> getJsonData() async {
//     var response = await http.get(
//     Uri.parse(http.get(url))
//     );
//     if (response.statusCode == 200) {
//       final convertDataJson = jsonDecode(response.body);

//       return IndiaCases.fromJson(convertDataJson);
//     } else {
//       throw Exception("Try to reload");
//     }
//   }

//   Future fetchData() async {
//     getJsonData();
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.getJsonData();
//   }

//   // navigatetograph() async {
//   //   await Navigator.push(
//   //       context, MaterialPageRoute(builder: (context) => IndiaGraph()));
//   // }

//   // navigatetostates() async {
//   //   await Navigator.push(
//   //       context, MaterialPageRoute(builder: (context) => indPage()));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffF3E5F5),
//         body: Container(
          
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 FutureBuilder<IndiaCases>(
//                   future: getJsonData(),
//                   builder: (BuildContext context, Snapshot) {
//                     if (Snapshot.hasData) {
//                       final covidData = Snapshot.data;
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Center(
//                             child: Container(
//                               child: Image.asset(
//                                 "images/own_test.png",
//                                 width: 150.0,
//                                 height: 150.0,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 20.0),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.all(10),
//                                 child: Text(
//                                   "India COVID-19",
//                                   style: GoogleFonts.poppins(
//                                       textStyle: TextStyle(
//                                     color: Color(0xffB39DDB),
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.w500,
//                                   )),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10.0,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   navigatetostates();
//                                 },
//                                 child: Expanded(
//                                   child: Container(
//                                     width: double.infinity / 4,
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       color: Color(0xffB39DDB),
//                                     ),
//                                     child: Text(
//                                       "Regional",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 18.0),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(
                          //           horizontal: 1.0,
                          //         ),
                          //         width: 200.0,
                          //         height: 100.0,
                          //         child: Card(
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(15.0),
                          //           ),
                          //           elevation: 10.0,
                          //           color: Color(0xffB39DDB),
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 15.0),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     SizedBox(
                          //                       height: 10.0,
                          //                     ),
                          //                     Text(
                          //                       "India",
                          //                       style: TextStyle(
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w700,
                          //                           fontSize: 15.0),
                          //                     ),
                          //                     SizedBox(
                          //                       height: 5.0,
                          //                     ),
                          //                     Text(
                          //                       "Today's Cases",
                          //                       style: TextStyle(
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: 18.0),
                          //                     ),
                          //                     Text(
                          //                       "${covidData.activeCasesNew}",
                          //                       style: TextStyle(
                          //                           color: Color(0xff7E57C2),
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: 20.0),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(
                          //           horizontal: 1.0,
                          //         ),
                          //         width: 200.0,
                          //         height: 100.0,
                          //         child: Card(
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(15.0),
                          //           ),
                          //           elevation: 10.0,
                          //           color: Color(0xff9FA8DA),
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 15.0),
                          //             child: Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.spaceBetween,
                          //               children: [
                          //                 Column(
                          //                   crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceEvenly,
                          //                   children: [
                          //                     SizedBox(
                          //                       height: 10.0,
                          //                     ),
                          //                     Text(
                          //                       "India",
                          //                       style: TextStyle(
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w700,
                          //                           fontSize: 15.0),
                          //                     ),
                          //                     SizedBox(
                          //                       height: 5.0,
                          //                     ),
                          //                     Text(
                          //                       "Total Cases",
                          //                       style: TextStyle(
                          //                           color: Colors.white,
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: 18.0),
                          //                     ),
                          //                     Text(
                          //                       "${covidData.activeCases}",
                          //                       style: TextStyle(
                          //                           color: Color(0xff3F51B5),
                          //                           fontWeight: FontWeight.w400,
                          //                           fontSize: 20.0),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 1.0,
//                                   ),
//                                   width: 200.0,
//                                   height: 100.0,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     elevation: 10.0,
//                                     color: Color(0xff4FC3F7),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 SizedBox(
//                                                   height: 10.0,
//                                                 ),
//                                                 Text(
//                                                   "India",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       fontSize: 15.0),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5.0,
//                                                 ),
//                                                 Text(
//                                                   "Today's Recovery",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 18.0),
//                                                 ),
//                                                 Text(
//                                                   "${covidData.recoveredNew}",
//                                                   style: TextStyle(
//                                                       color: Color(0xfF01579B),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 20.0),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 1.0,
//                                   ),
//                                   width: 200.0,
//                                   height: 100.0,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     elevation: 10.0,
//                                     color: Color(0xff81C784),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               children: [
//                                                 SizedBox(
//                                                   height: 10.0,
//                                                 ),
//                                                 Text(
//                                                   "India",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       fontSize: 15.0),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5.0,
//                                                 ),
//                                                 Text(
//                                                   "Total Recovered",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 18.0),
//                                                 ),
//                                                 Text(
//                                                   "${covidData.recovered}",
//                                                   style: TextStyle(
//                                                       color: Color(0xff2E7D32),
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 20.0),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 1.0,
//                                   ),
//                                   width: 200.0,
//                                   height: 100.0,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     elevation: 10.0,
//                                     color: Color(0xffFFB74D),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               SizedBox(
//                                                 height: 10.0,
//                                               ),
//                                               Text(
//                                                 "India",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w700,
//                                                     fontSize: 15.0),
//                                               ),
//                                               SizedBox(
//                                                 height: 5.0,
//                                               ),
//                                               Text(
//                                                 "Today's Death",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 18.0),
//                                               ),
//                                               Text(
//                                                 "${covidData.deathsNew}",
//                                                 style: TextStyle(
//                                                     color: Color(0xffE65100),
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 20.0),
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 1.0,
//                                   ),
//                                   width: 200.0,
//                                   height: 100.0,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                     ),
//                                     elevation: 10.0,
//                                     color: Color(0xff4DB6AC),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               SizedBox(
//                                                 height: 10.0,
//                                               ),
//                                               Text(
//                                                 "India",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w700,
//                                                     fontSize: 15.0),
//                                               ),
//                                               SizedBox(
//                                                 height: 5.0,
//                                               ),
//                                               Text(
//                                                 "Total Death",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 18.0),
//                                               ),
//                                               Text(
//                                                 "${covidData.deaths}",
//                                                 style: TextStyle(
//                                                     color: Color(0xff004D40),
//                                                     fontWeight: FontWeight.w400,
//                                                     fontSize: 20.0),
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       );
//                     } else if (Snapshot.hasError) {
//                       return Text(Snapshot.error.toString());
//                     } else
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Center(child: CircularProgressIndicator()),
//                         ],
//                       );
//                   },
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
