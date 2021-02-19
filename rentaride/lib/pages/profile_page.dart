import 'package:flutter/material.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 70,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo_outlined),
                  color: Colors.blue[700],
                  onPressed: (){}, ),
              ),
            ),
            ListTile(title: Center(child: Text("@Username")),),
            Divider(thickness: 0.8, height: 30,),
            ListTile(
              title: nameTextField(),
            ),
            ListTile(
              title: dobTextField(),
            ),
            ListTile(
              title: bioTextField(),
            )
          ],
        ),
      ),
    );
  }

  Widget nameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        labelText: "Name",
        hintText: "John Walls",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget bioTextField(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        labelText: "Bio",
        hintText: "23, App Developer",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Future<Null> _selectedDate(BuildContext context) async {
    DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1950, 1), lastDate: DateTime(2030));
    if(picked != null && picked != selectedDate){
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: picked.toString());
      });
    }
  }
  Widget dobTextField(){
    return GestureDetector(
      onTap: (){
        _selectedDate(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _date,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              color: Colors.blue,
              onPressed: (){},
            ),
            hintText: "Date of Birth",
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}

