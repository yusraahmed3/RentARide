// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rentaride/NetworkHandler.dart';
// import 'file:///C:/Users/yusra/OneDrive/Documents/RentARide/rentaride/lib/user/screens/Welcome.dart';
// import 'package:rentaride/pages/cardata.dart';
// import 'package:rentaride/pages/profile_page.dart';
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     bool circular = false;
//     return Scaffold(
//       endDrawer: new Drawer(
//           child: ListView(
//             children: [
//               ListTile(
//                 title: CircleAvatar(backgroundColor: Colors.black, radius: 65,),
//
//
//               ),
//               Divider(thickness: 0.8, height: 40,),
//               ListTile(
//                 title: InkWell(
//                   onTap: (){
//                     Navigator.of(context).pop();
//                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilePage()));
//                   },
//                     child: Center(child: Text("View Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
//               ),
//               Divider(thickness: 0.8, height: 25,),
//               ListTile(
//                 title: InkWell(
//                     onTap: (){},
//                     child: Center(child: Text("Dealers",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)) ),
//               ),
//               Divider(thickness: 0.8, height: 25,),
//               ListTile(
//                 title: InkWell(
//                     onTap: (){},
//                     child: Center(child: Text("Change account settings",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
//               ),
//               Divider(thickness: 0.8, height: 25,),
//               ListTile(
//                 title: InkWell(
//                     onTap: (){
//                       Navigator.of(context).pop();
//                       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Welcome()));
//                     },
//                     child: Center(child: Text("Log Out",  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
//               ),
//             ],
//           )),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         brightness: Brightness.light,
//         title: Text("Rent-A-Ride",
//           style: TextStyle(
//             fontSize: 30,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           Builder(
//           builder: (context) => Padding(
//             padding: const EdgeInsets.only(right: 16),
//             child: IconButton(
//                 icon: Icon(Icons.menu,),
//                   onPressed: (){
//                   Scaffold.of(context).openEndDrawer();
//                   },
//                   color: Colors.black,
//                   iconSize: 25,
//                   ),
//           ),
//       ),
//         ],
//       ),
//       body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Container(
//                 height: 70,
//                 width: 400,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Text("Top Deals", style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[400],)
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               child: CarListView(),
//             ),
//
//           ]
//       ),
//     );
//   }
//
//   Widget carList(){
//     ListView(
//       children: [
//         Text("Drawer 1"),
//         Divider(thickness: 0.8,),
//         Text("Drawer 2"),
//         Divider(thickness: 0.8,),
//         Text("Drawer 3"),
//         Divider(thickness: 0.8,),
//       ],
//     );
//
//   }
//
// }
//
//
//
//
//
//
//
//
