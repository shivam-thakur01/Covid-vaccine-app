import 'package:flutter/material.dart';

class CertiDownload extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vaccine Update'),),
      body: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: Container(
            child: Column(children: [
              Container(
                child: Text('Download vaccination certificate'),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Beneficiary Number'),
                ),
              )
            ],),
          ),
      )
    );
  }
}