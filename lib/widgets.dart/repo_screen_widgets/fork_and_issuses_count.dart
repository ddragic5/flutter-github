// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/repository_provider.dart';

Wrap ForkAndIssuesCount(
  repos,
  int index,
  RepositoryProvider repo,
) {
  return Wrap(children: <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fork count: ${repos.fork_count}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Issues count : ${repos.issue_count}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Stars count : ${repos.stars}',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  ]);
}
