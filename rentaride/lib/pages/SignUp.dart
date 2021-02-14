import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:rentaride/NetworkHandler.dart';
import 'package:rentaride/pages/HomePage.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visible = true;
  final _globkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _userController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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
                'Create an account',
                style: (TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                )),
              ),
              SizedBox(height: 35.0,),
              usernameTextField(),
              emailTextField(),
              passwordTextField(),
              SizedBox(height: 20,),
              InkWell(
                onTap: () async {
                  setState(() {
                    circular = true;
                  });
                  await checkUser();
                  if (_globkey.currentState.validate() && validate) {
                    Map<String, String> data = {
                      "username": _userController.text,
                      "email": _emailController.text,
                      "password": _passController.text,
                    };
                    print(data);
                    var responseReg =
                    await networkHandler.post("/user/register", data);
                    if (responseReg.statusCode == 200 ||
                        responseReg.statusCode == 201) {
                      Map<String, String> data = {
                        "username": _userController.text,
                        "password": _passController.text,
                      };
                      var response = await networkHandler.post(
                          "/user/login", data);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        Map<String, dynamic> output = json.decode(
                            responseReg.body);
                        print(output["token"]);
                        await storage.write(
                            key: "token", value: output["token"]);
                        setState(() {
                          validate = true;
                          circular = false;
                        });
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) => HomePage()), (
                            route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Network Error")));
                      }
                    }
                    setState(() {
                      circular = false;
                    });
                  } else {
                    setState(() {
                      circular = false;
                    });
                  }
                },
                child: circular? CircularProgressIndicator() : Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }


  checkUser()async{
    if(_userController.text.length == 0){
      setState(() {
        //circular = false;
        validate = false;
        errText = "Username cannot be empty";
      });
    }
    else{
      var res = await networkHandler.get("/user/checkusername/${_userController.text}");
      if(res['Status']){
        setState(() {
          //circular = false;
          validate = false;
          errText = "Username already taken";
        });
      }
      else{
        setState(() {
          //circular = false;
          validate = true;
          //errText = "Username cannot be empty";
        });
      }
    }
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text("Username"),
          TextFormField(
            controller: _userController,
            decoration: InputDecoration(
              errorText: validate? null : errText,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
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

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text("Email"),
          TextFormField(
            controller: _emailController,
            validator: (value){
              if(value.isEmpty)
                return "Email cannot be empty.";
              if(!value.contains("@"))
                return "Invalid email.";
              return null;
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
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

  Widget passwordTextField() {
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
              helperText: "Password length should at least be 8 characters",
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
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

