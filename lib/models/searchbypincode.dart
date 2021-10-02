import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vaccine_update/widgets/displaycardwidget.dart';

class SearchByPinCode extends StatefulWidget {
  final String pin;
  final String date;
  SearchByPinCode({@required this.pin, @required this.date});

  @override
  _SearchByPinCodeState createState() => _SearchByPinCodeState();
}

class _SearchByPinCodeState extends State<SearchByPinCode> {
  Map<String, dynamic> listOfResponse;

  Future fetchData() async {
    final response = await http.get(Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
            widget.pin +
            '&date=' +
            widget.date));

    if (response.statusCode == 200) {
      setState(() {
        listOfResponse = jsonDecode(response.body);
        print(listOfResponse);
      });
    } else {
      throw Exception('Error');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listOfResponse != null) {
      if(listOfResponse['sessions'].length==0){
        return Container(
      height: MediaQuery.of(context).size.height * 0.57,
      margin: EdgeInsets.only(top: 5),
      child: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              border: Border.all(color: Colors.deepPurple,width: 2),borderRadius: BorderRadius.circular(15),
              image: new DecorationImage(image: new AssetImage("assests/images/no.jpg"), fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.95), BlendMode.dstATop),),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('No vaccine center found\nTry another Pincode',style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Stay Safe',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
            ],
          )
        ],
      ),
    );
      }
      else{
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfResponse['sessions'].length,
          itemBuilder: (BuildContext context, int index) {
            return DisplayCardWidget(
                address: listOfResponse['sessions'][index]['address'] +
                    ', ' +
                    listOfResponse['sessions'][index]['name'],
                date: listOfResponse['sessions'][index]['date'].toString(),
                vaccine: listOfResponse['sessions'][index]['vaccine'],
                dose1: listOfResponse['sessions'][index]
                        ['available_capacity_dose1']
                    .toString(),
                dose2: listOfResponse['sessions'][index]
                        ['available_capacity_dose2']
                    .toString(),
                age: listOfResponse['sessions'][index]['min_age_limit']
                    .toString());
          });
      }
    } else {
      return Container(
        height: MediaQuery.of(context).size.height*0.57,
        child: Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.purple),
              strokeWidth: 6,
        )),
      );
    }
  }
}