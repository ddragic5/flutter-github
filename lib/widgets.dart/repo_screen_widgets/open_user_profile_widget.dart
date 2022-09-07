import 'package:flutter/material.dart';

import '../../providers/page_route_provider.dart';
import '../../providers/repository_provider.dart';

// ignore: non_constant_identifier_names
InkWell OpenUserProfileWidget(onPressedProvider route, RepositoryProvider repo,
    int index, BuildContext context, repos) {
  return InkWell(
    onTap: () async {
      (route.onPressed(username: '${repos.author}', context: context));
    },
    child: CircleAvatar(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network('${repos.avatarUrl}'),
    )),
  );
}
