import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carental/car/car.dart';

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
        title: Text('${widget.args.edit ? "Edit Car" : "Add New Car"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.car.brand : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car Brand';
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
                  initialValue: widget.args.edit ? widget.args.car.model : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car model';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Car Model'),
                  onSaved: (value) {
                    setState(() {
                      this._car["model"] = value;
                    });

                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.car.price.toString()
                      : '',
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
                  initialValue:
                  widget.args.edit ? widget.args.car.period : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter car rent period';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Rent period'),
                  onSaved: (value) {
                    setState(() {
                      this._car["period"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formkey.currentState;
                    if (form.validate()) {
                      form.save();
                      final CarEvent event = widget.args.edit ? CarUpdate(
                        CarModel(
                          brand: this._car["brand"],
                          model: this._car["model"],
                          price: this._car["price"],
                          period: this._car["period"],
                        )
                      )
                     : CreateCar(
                        CarModel(
                          brand: this._car["brand"],
                          model: this._car["model"],
                          price: this._car["price"],
                          period: this._car["period"],
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
