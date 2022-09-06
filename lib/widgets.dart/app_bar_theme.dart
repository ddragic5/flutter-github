import 'package:flutter/material.dart';

AppBar appBarTheme({required String title, icon}) {
  return AppBar(
    backgroundColor: Colors.black87,
    foregroundColor: Colors.white,
    title: Text(
      title,
    ),
    centerTitle: true,
    flexibleSpace: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.teal,
                  Colors.greenAccent,
                ]))),
  );
}
