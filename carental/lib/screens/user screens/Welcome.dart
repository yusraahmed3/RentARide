import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/screens/screens.dart';
import 'package:carental/bloc/bloc.dart';
import 'package:carental/models/models.dart';

class Welcome extends StatefulWidget {
 static const routeName='/';
  
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool visible = true;

//   final _globkey = GlobalKey<FormState>();
//   final Map<String, dynamic> _user = {};
//   NetworkHandler networkHandler = NetworkHandler();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passController = TextEditingController();

//   String errText;
//   bool validate = false;
  bool circular = false;
<<<<<<< HEAD:carental/lib/screens/user screens/Welcome.dart
  final UserEvent loginevent = UserLogIn(User(username: "yusra45", password: "12345678"));
=======
  _login(ctx) async {
    setState(() {

    });
    final UserEvent loginevent = UserLogIn(User(username: _usernameController.text, password: _passController.text));
    BlocProvider.of<UserBloc>(ctx).add(loginevent);
    print("Let's see");
  }


>>>>>>> ab8f701ebcd2b2a2dd59c7963b2e6ae205f3bd96:carental/lib/user/screens/Welcome.dart

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserOperationFailure) {
            Text("Failed");
          }
          if (state is UserLoadSuccess) {
            Navigator.pushNamed(context, CarList.routeName);
            print("Okay");
          }
        },
        builder: (context, state) {
          return _loginForm(context);
        },
      ),
    );
  }
  Widget _loginForm(context){
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(0.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.repeated,
            ),
          ),
<<<<<<< HEAD:carental/lib/screens/user screens/Welcome.dart
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  'Rent-A-Ride',
                  style: (TextStyle(
                    color: Colors.indigo[700],
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  )),
                ),
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
=======
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Rent-A-Ride',
                    style: (TextStyle(
                      color: Colors.indigo[700],
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    )),
                  ),
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
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUp.routeName);
                      },
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
                  onTap: () {
                      _login(context);
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
>>>>>>> ab8f701ebcd2b2a2dd59c7963b2e6ae205f3bd96:carental/lib/user/screens/Welcome.dart
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: circular ? CircularProgressIndicator() :
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
        );
  }


//     return Scaffold(
//       //resizeToAvoidBottomPadding: false,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.blue],
//             begin: const FractionalOffset(0.0, 1.0),
//             end: const FractionalOffset(0.0, 1.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.repeated,
//           ),
//         ),
//         child: Form(
//           key: _globkey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                   'Rent-A-Ride',
//                   style: (TextStyle(
//                     color: Colors.indigo[700],
//                     fontSize: 30,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 2,
//                   )),
//               ),
//               SizedBox(height: 65.0,),
//             Text(
//                   'Great cars for great people.',
//                   textAlign: TextAlign.center,
//                   style: (TextStyle(
//                     color: Colors.indigo[700],
//                     fontSize: 27,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 2,
//                   )),
//               ),
//               SizedBox(height: 25.0),
//               usernameTextField(),
//               passwordTextField(),
//               SizedBox(height: 10,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Text(
//                     'Forgot Password?',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(width: 25,),
//                   InkWell(
//                     onTap: (){
//                       Navigator.of(context).pushNamedAndRemoveUntil(
//                           SignUp.routeName, (route) => false);
//                     },
//                     child: Container(
//                       child: Text(
//                         'New User?',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 38,),
//               InkWell(
//                 onTap: () async{
//                   final form = _globkey.currentState;
//                   if(form.validate()){
//                     form.save();
//                     // Map<String, String> data = {
//                     //   "username": _usernameController.text,
//                     //   "password": _passController.text,
//                     // };
//                     final UserEvent event = UserLogIn(User(
//                       username: this._user["username"],
//                       password: this._user["password"],
//                     ));
//                     BlocProvider.of<UserBloc>(context).add(event);
//                     Navigator.of(context).pushNamedAndRemoveUntil(
//                         UserList.routeName, (route) => false);
//                   }
//                   },
//
//                   // setState(() {
//                   //   circular = true;
//                   // });
//
//                   // var response = await networkHandler.post("/user/login", data);
//                   // if(response.statusCode==200 || response.statusCode==201){
//                   //   Map<String, dynamic> output = json.decode(response.body);
//                   //     print(output["token"]);
//                   //     await storage.write(key: "token", value: output["token"]);
//                   //     setState(() {
//                   //       validate = true;
//                   //       circular = false;
//                   //     });
//                   //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
//                   // }
//                   // else{
//                   //   String output = json.decode(response.body);
//                   //   setState(() {
//                   //     validate = false;
//                   //     errText = output;
//                   //     circular = false;
//                   //   });
//                   //}
//                   child: Container(
//                     width: 150,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.blue,
//                     ),
//                     child: Center(
//                       child: circular ? CircularProgressIndicator():
//                       Text(
//                         'Log In',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//            ),
//         ),
//       ),
//     );
//   }
//
//
  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Text("Username"),
          TextFormField(
            controller: _usernameController,
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

//
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
              // errorText: validate ? null: errText,
                suffixIcon: IconButton(
                  icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
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

