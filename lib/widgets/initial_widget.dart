import 'package:flutter/material.dart';

class InitialWidget extends StatelessWidget {
  final String text;
  final String img;

  const InitialWidget({@required this.text,@required this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.602,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(15),
              image: new DecorationImage(
                image: new AssetImage("assests/images/"+img+".jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              margin: EdgeInsets.all(8),
              color: Colors.black26,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
