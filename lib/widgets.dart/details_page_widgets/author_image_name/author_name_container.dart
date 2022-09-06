// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Container AuthorNameContainer({required String repo}) {
  return Container(
    height: 40,
    width: 150,
    color: const Color.fromRGBO(51, 51, 51, 0),
    child: Container(
      margin: const EdgeInsets.only(left: 40),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            repo,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
