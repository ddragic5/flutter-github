import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Row RepoContainerRow({
  required icon,
  required String description,
}) {
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
