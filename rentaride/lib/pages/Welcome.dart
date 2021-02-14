import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentaride/NetworkHandler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rentaride/pages/HomePage.dart';


import 'SignUp.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool visible = true;
  final _globkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String errText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Form(
          key: _globkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Rent-A-Ride',
                  style: (TextStyle(
                    color: Colors.indigo[700],
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  )),
              ),
              SizedBox(height: 65.0,),
            Text(
                  'Great cars for great people.',
                  textAlign: TextAlign.center,
                  style: (TextStyle(
                    color: Colors.indigo[700],
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  )),
              ),
              SizedBox(height: 25.0),
              usernameTextField(),
              passwordTextField(),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 25,),
                  InkWell(
                    onTap: onSignUpClick,
                    child: Container(
                      child: Text(
                        'New User?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 38,),
              InkWell(
                onTap: () async{
                  setState(() {
                    circular = true;
                  });
                  Map<String, String> data = {
                    "username": _usernameController.text,
                    "password": _passController.text,
                  };
                  var response = await networkHandler.post("/user/login", data);
                  if(response.statusCode==200 || response.statusCode==201){
                    Map<String, dynamic> output = json.decode(response.body);
                      print(output["token"]);
                      await storage.write(key: "token", value: output["token"]);
                      setState(() {
                        validate = true;
                        circular = false;
                      });
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                  }
                  else{
                    String output = json.decode(response.body);
                    setState(() {
                      validate = false;
                      errText = output;
                      circular = false;
                    });
                  }
                },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: circular ? CircularProgressIndicator():
                      Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
           ),
        ),
      ),
    );
  }
  onSignUpClick(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp(),));
  }

  Widget usernameTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text("Username"),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              errorText: validate ? null: errText,
              focusedBorder: UnderlineInputBorder(
                borderSide:  BorderSide(
                  color: Colors.black,
                  width: 2,
                )
              )
            ),
          )
        ],
      ),
    );
  }

  Widget passwordTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text("Password"),
          TextFormField(
            controller: _passController,
            obscureText: visible,
            decoration: InputDecoration(
              errorText: validate ? null: errText,
                suffixIcon: IconButton(
                  icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide:  BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                )
            ),
          )
        ],
      ),
    );
  }


}