import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class SelfDeclaration extends StatefulWidget {
  @override
  _SelfDeclarationState createState() => _SelfDeclarationState();
}

class _SelfDeclarationState extends State<SelfDeclaration> {
  int isInfected;
  int gender;
  int travelled = 0;
  TextEditingController nameEditor = new TextEditingController();
  TextEditingController fnameEditor = new TextEditingController();

  Widget travel() {
    if (travelled == 1) {
      return Text("");
    } else if (travelled == 0) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButton(
              hint: Text('Select Travelled Country',
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
              value: selectedDistrict,
              onChanged: (newValue) {
                setState(() {
                  selectedDistrict = newValue;
                });
              },
              items: dRajasthan.map((location) {
                return DropdownMenuItem(
                  child:
                      new Text(location, style: TextStyle(color: Colors.black)),
                  value: location,
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ]),
                child: MaterialButton(
                  onPressed: () async {
                    DateTime newDateTime = await showRoundedDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      borderRadius: 2,
                    );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  child: Text("From"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ]),
                child: MaterialButton(
                  onPressed: () async {
                    DateTime newDateTime = await showRoundedDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      borderRadius: 2,
                    );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  child: Text("To"),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    }
  }

  String selectedState;
  List<String> states = ["Rajasthan", "up", "Gujrat"];
  List<String> country = ["India", "China", "Italy"];
  String selectedDistrict;
  List<String> dRajasthan = [
    "alwar",
    "jaipur",
    "bikaner",
    "jaisalmer",
    "bhilwara",
    "kota"
  ];
  List<String> dUP = ["kanpur", "lucknow"];
  List<String> def = ["Select your district"];
  DateTime dateTime;
  Duration duration;
  @override
  void initState() {
    dateTime = DateTime.now();
    duration = Duration(minutes: 10);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF3180e4),
          Color(0xFF564dc2),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Image(
                    width: 300, image: AssetImage("assets/images/covid19.png")),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(left: 5.0),
                  height: 45.0,
                  //width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    obscureText: false,
                    controller: nameEditor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.red,
                        focusColor: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Father's name",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  margin: EdgeInsets.all(10.0),
                  height: 45.0,
                  //width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    obscureText: false,
                    controller: fnameEditor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Gender",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Male"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 0,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              }),
                          Text("Female"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 1,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Are you Infected?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Yes"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 0,
                              groupValue: isInfected,
                              onChanged: (value) {
                                setState(() {
                                  isInfected = value;
                                });
                              }),
                          Text("No"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 1,
                              groupValue: isInfected,
                              onChanged: (value) {
                                setState(() {
                                  isInfected = value;
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Have Travelled?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Yes"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 0,
                              groupValue: travelled,
                              onChanged: (value) {
                                setState(() {
                                  travelled = value;
                                });
                              }),
                          Text("No"),
                          new Radio(
                              activeColor: Colors.black,
                              value: 1,
                              groupValue: travelled,
                              onChanged: (value) {
                                setState(() {
                                  travelled = value;
                                });
                              }),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                travel(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        // border: Border.all(
                        //     color: Colors.white,
                        //     style: BorderStyle.solid,
                        //     width: 0.80),
                      ),
                      child: DropdownButton(
                        iconDisabledColor: Colors.black,
                        hint: Text(
                          'Select your State',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                        value: selectedState,
                        onChanged: (newValue) {
                          setState(() {
                            selectedState = newValue;
                          });
                        },
                        items: states.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location,
                                style: TextStyle(color: Colors.black)),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: DropdownButton(
                        hint: Text('Select your District',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0)),
                        value: selectedDistrict,
                        onChanged: (newValue) {
                          setState(() {
                            selectedDistrict = newValue;
                          });
                        },
                        items: dRajasthan.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location,
                                style: TextStyle(color: Colors.black)),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: Text(
                        "Longitude",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      width: 100,
                      height: 30.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: Text(
                        "Lattitude",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10.0),
                          ]),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("Get Location"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 150.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF3180e4),
                            Color(0xFF564dc2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10.0),
                      ]),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
