import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat_ui/pages/root_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
    theme: ThemeData(
      textTheme: GoogleFonts.nunitoTextTheme(),
    ),
  ));
}
