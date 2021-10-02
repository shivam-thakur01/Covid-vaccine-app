import 'package:flutter/material.dart';
import 'package:vaccine_update/models/searchbydistrict.dart';
import 'package:intl/intl.dart';
import 'package:vaccine_update/widgets/initial_widget.dart';

class SearchByDistrictScreen extends StatefulWidget {

  @override
  _SearchByDistrictScreenState createState() => _SearchByDistrictScreenState();
}

class _SearchByDistrictScreenState extends State<SearchByDistrictScreen> {
    final districtCodeController = TextEditingController();
  final dateController = TextEditingController();

  bool status = false;

  DateTime currentDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

    dataSubmitted() {
    if (districtCodeController.text.length == 3) {
      setState(() {
        status = true;
        
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vaccine update'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Card(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'District Code'),
                  controller: districtCodeController,
                  onSubmitted: (_) => dataSubmitted(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple,width: 2),borderRadius: BorderRadius.circular(4)),
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.015),
                height: MediaQuery.of(context).size.height * 0.076,
                child: MaterialButton(
                  onPressed: () => selectDate(context),
                  child: Container(
                      width: double.infinity,
                      child: Text('Date: '+
                        DateFormat('dd/MM/yyyy').format(currentDate),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16.5),
                      )),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () => dataSubmitted(),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    color: status==true?Color.fromRGBO(151, 227, 110, 0.85):Colors.green,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => SearchByDistrictScreen())),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    color: Colors.red,
                  ),
                ],
              ),
              Container(
                child: status==true?Container(
                child: Column(
                  children: [
                    Container(
                      child: Text('Availability',style: TextStyle(fontFamily: 'Raleway',fontSize: 22,fontWeight: FontWeight.bold,color: Colors.purple,decoration: TextDecoration.underline),),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                      // padding: EdgeInsets.symmetric(vertical: 5),
                      // decoration: BoxDecoration(border: Border.all(color: Colors.deepPurple,width: 2),borderRadius: BorderRadius.circular(15)),
                      height: MediaQuery.of(context).size.height * 0.58,
                      child: SingleChildScrollView(
                        child:  SearchByDistrict(districtId: districtCodeController.text, date: DateFormat('dd-MM-yyyy').format(currentDate))
                        ),
                    ),
                  ],
                ),
                ):InitialWidget(text: 'Get your shot by District code',img: 'pincodescreen1',)
              )
            ],
          ),
        ),
      ),
    );
  }
}
