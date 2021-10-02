import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vaccine_update/screen/searchbydistrictscreen.dart';
import 'package:vaccine_update/screen/searchbypincode_screen.dart';
import 'package:vaccine_update/models/certificatedownload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amberAccent,
          // canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('vaccine Update'),
        ),
        body: Stack(
          children: [
            Container(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
              image: new ExactAssetImage('assests/images/home.jpg'),
            ))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        color: Colors.amberAccent,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Check by Area Pincode',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PincodeScreen()));
                  },
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        color: Colors.amberAccent,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Check by District code',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchByDistrictScreen()));
                  },
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.115),
              child: InkWell(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        color: Colors.amberAccent,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Download vaccination certificate',
                          style: TextStyle(
                            fontSize: 19,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CertiDownload()));
                  }),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.025),
              child: Row(
                children: [
                  InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            color: Colors.amberAccent,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Vaccination Dashboard',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => launch('https://dashboard.cowin.gov.in/')),
                  InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            color: Colors.amberAccent,
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'CoWin\nWebsite',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      onTap: () => launch('https://www.cowin.gov.in/home')),
                ],
              ),
            )
          ],
        )

        // Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       margin: EdgeInsets.all(10),
        //       child: Text('Find your vaccine.',textAlign: TextAlign.center,style: TextStyle(fontSize: 25),)),
        //       Card(
        //         child: MaterialButton(
        //           child: Text('Search by PinCode'),
        //           onPressed: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=>PincodeScreen()));
        //         },),
        //       ),
        //       Card(
        //         child: MaterialButton(
        //           child: Text('Search by District Code'),
        //           onPressed: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchByDistrictScreen()));
        //         },),
        //       )
        //   ],
        // )
        );
  }
}
