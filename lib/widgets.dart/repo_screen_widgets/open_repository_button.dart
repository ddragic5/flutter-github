// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/page_route_provider.dart';
import '../../providers/repository_provider.dart';

ButtonBar OpenRepositoryButton(
  BuildContext context,
  repos,
  int index,
  onPressedProvider route,
  RepositoryProvider repo,
) {
  return ButtonBar(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 30,
          width: 150,
          color: Colors.greenAccent,
          child: MaterialButton(
              onPressed: () async {
                (route.onPressedOpenRepo(
                    full_name: '${repos.full_name}',
                    username: '${repos.author}',
                    context: context));
              },
              child: const Text(
                'Open Repository',
                style: TextStyle(color: Colors.white),
              )),
        ),
      )
    ],
  );
}
