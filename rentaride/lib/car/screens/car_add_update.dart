import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/car/car.dart';

class AddUpdateCar extends StatefulWidget{
  static const routeName='carAddUpdate';
  final CarArgument args;
  AddUpdateCar({this.args});
  @override
  _AddUpdateCarState createState() =>_AddUpdateCarState();
}
class _AddUpdateCarState extends State<AddUpdateCar>{
  final _formkey =GlobalKey<FormState>();
  final Map<String, dynamic> _car={};
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Add a Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Car Brand'),
                  onSaved: (value) {
                    setState(() {
                      this._car["brand"] = value;
                    });
                  }),
              TextFormField(

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car model';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Car Model'),
                  onSaved: (value) {
                    this._car["model"] = value;
                  }),
              TextFormField(

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Car price'),
                  onSaved: (value) {
                    setState(() {
                      this._car["price"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car rentperiod';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Rentperiod'),
                  onSaved: (value) {
                    setState(() {
                      this._car["rentperiod"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formkey.currentState;
                    if (form.validate()) {
                      form.save();
                      final CarEvent event = CreateCar(
                        CarModel(
                          brand: this._car["brand"],
                          model: this._car["model"],
                          price: this._car["price"],
                          rentperiod: this._car["rentperiod"],
                        ),
                      );
                      BlocProvider.of<CarBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          CarList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
