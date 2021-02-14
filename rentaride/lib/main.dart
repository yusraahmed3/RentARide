import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/Welcome.dart';

void main() => runApp(RentARide());

class RentARide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Welcome());
  }

}