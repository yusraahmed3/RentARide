// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CarCreate extends StatefulWidget {
//   static const routeName= 'carAdd';
//
//   @override
//   _CarCreateState createState() => _CarCreateState();
// }
//
// class _CarCreateState extends State<CarCreate> {
//
//   PickedFile _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   final Map<String, dynamic> _car={};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text( "Rent-A-Ride"),
//       ),
//       body: Column(
//         children: [
//           Text(
//             "Add Car",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//           TextFormField(
//             validator: (value){
//               if(value.isEmpty){
//                 return 'Please enter car brand name';
//               }
//               return null;
//             },
//             decoration: InputDecoration(labelText: 'Car Brand'),
//             onSaved: (value) {
//               setState(() {
//                 this._car["brand"] = value;
//               });
//             } ),
//           TextFormField(
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'Please enter car model name';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(labelText: 'Car Model'),
//               onSaved: (value) {
//                 setState(() {
//                   this._car["model"] = value;
//                 });
//               } ),
//           TextFormField(
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'Please enter car price name';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(labelText: 'Car Price'),
//               onSaved: (value) {
//                 setState(() {
//                   this._car["price"] = value;
//                 });
//               } ),
//           TextFormField(
//               validator: (value){
//                 if(value.isEmpty){
//                   return 'Please choose rent period';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(labelText: 'Rent period'),
//               onSaved: (value) {
//                 setState(() {
//                   this._car["rentperiod"] = value;
//                 });
//               } ),
//             _imageCar(),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: InkWell(
//               child: Center(
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//
// }
// Widget _imageCar() {
//   return Center(
//     child: Stack(
//       children: <Widget>[
//         CircleAvatar(
//           radius: 80.0,
//           backgroundImage: _imageFile == null ? AssetImage("assets/lightning.jpg") : FileImage(File(_imageFile.path)),
//         ),
//         Positioned(
//             bottom: 20.0,
//             right: 20.0,
//             child: InkWell(
//               onTap: () {
//                 bottomSheet();
//               },
//               child: Icon(
//                 Icons.camera_alt,
//                 color: Colors.blue,
//                 size: 28,
//               ),
//             )),
//       ],
//     ),
//   );
// }
//     Widget bottomSheet(){
//       return Container(
//         height: 100,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//            children: [
//              Text(
//                "Choose a photo",
//                style: TextStyle(
//                  fontSize: 20,
//                ),
//              ),
//              SizedBox(height: 20,),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  TextButton.icon(
//                      onPressed: (){
//                        takePhoto(ImageSource.camera);
//                      },
//                      icon: Icon(Icons.camera),
//                      label: Text("Camera")),
//                  TextButton.icon(
//                      onPressed: (){
//                        takePhoto(ImageSource.gallery);
//                      },
//                      icon: Icon(Icons.image),
//                      label: Text("Gallery")),
//                ],
//              )
//            ],
//         ),
//       );
//     }
//
//     void takePhoto(ImageSource source) async{
//     final pickedFile = await _picker.getImage(
//         source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile;
//     });
//     }
//
// }