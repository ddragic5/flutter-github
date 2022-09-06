// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Row UserInfoRepoDetailsPage({required icon, required String description}) {
  return Row(
    children: [
      icon,
      const SizedBox(
        width: 10,
      ),
      Text(
        description,
        style: const TextStyle(color: Colors.white),
      ),
    ],
  );
}
