import 'package:flutter/material.dart';

import '../../providers/page_route_provider.dart';
import '../../providers/repository_provider.dart';

InkWell OpenUserProfileWidget(onPressedProvider route, RepositoryProvider repo,
    int index, BuildContext context) {
  return InkWell(
    onTap: () async {
      (route.onPressed(
          username: '${repo.repoList[index].author}', context: context));
    },
    child: CircleAvatar(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network('${repo.repoList[index].avatarUrl}'),
    )),
  );
}
