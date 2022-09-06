// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/page_route_provider.dart';
import '../../providers/repository_provider.dart';
import '../../screens/details.dart';

ButtonBar OpenRepositoryButton(BuildContext context, RepositoryProvider repo,
    int index, onPressedProvider route) {
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
                    full_name: '${repo.repoList[index].full_name}',
                    username: '${repo.repoList[index].author}',
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
