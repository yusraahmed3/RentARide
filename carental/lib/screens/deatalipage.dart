import 'package:flutter/material.dart';
import 'package:carental/models/models.dart';
import 'package:carental/screens/screens.dart';

class RentedCarDetail extends StatefulWidget {
  static const routName = 'RentedCarDetail';

  @override
  _RentedCarDetail createState() => _RentedCarDetail();

}
class _RentedCarDetail extends State<RentedCarDetail>{
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _rentedcar = {};


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 //////       title: Text('${widget.args.edit ? "Edit Course" : "Add New Course"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children:<Widget>[
              TextFormField(

      ///           widget.arg.edti ? widget.args.car.rentperiod:'',
                  validator :(value){
                if(value.isEmpty){
                  return 'please enter the rent period';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Rent Period'),
              onSaved:(value){
                setState((){
                  this._rentedcar["rentedcar"]=value;
                });
              }
            ),
            RaisedButton(
               child: Text('Rented', style: TextStyle(fontSize: 20.0),),  
                color: Colors.blueAccent,  
                textColor: Colors.white,  
                onPressed: () {},)
            
            ]
          ),
        ),
      ),
    );
  }
}

