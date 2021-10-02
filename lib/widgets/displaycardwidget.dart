import 'package:flutter/material.dart';

class DisplayCardWidget extends StatelessWidget {
  final String address;
  final String date;
  final String vaccine;
  final String dose1;
  final String dose2;
  final String age;

  const DisplayCardWidget(
      {@required this.address,
      @required this.date,
      @required this.vaccine,
      @required this.dose1,
      @required this.dose2,
      @required this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 3),
        child: Card(elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text('Address : '),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(address))
                  ],
                ),
                Row(
                  children: [
                    Text('Vaccine : '),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(vaccine))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('Dose 1 : '+dose1)),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('Dose 2 : '+dose2))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text('Age : '+age)),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('Date : '+date))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
