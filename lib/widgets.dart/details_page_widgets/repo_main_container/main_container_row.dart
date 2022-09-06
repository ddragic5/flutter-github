// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Padding MainContainerRow(
    {required text, required String description, required context}) {
  return Padding(
      padding: const EdgeInsets.all(8),
      child: IntrinsicHeight(
        child: Row(children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
            child: Text(
              '$text',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white60,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
            child: VerticalDivider(
              thickness: 2,
              width: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ));
}
