import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:search_github/widgets.dart/details_page_widgets/user_details_page.dart/user_info_view_row.dart';

import '../../../providers/user_provider.dart';

// ignore: non_constant_identifier_names
Column UserInfoDetailsPage(
    DateFormat dateF, UserProvider user, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      UserInfoRepoDetailsPage(
        icon: const Icon(Icons.account_circle, color: Colors.white),
        description: 'Followers: ${user.user!.username}',
      ),
      UserInfoRepoDetailsPage(
        icon: const Icon(Icons.local_fire_department_outlined,
            color: Colors.white),
        description: 'Followers: ${user.user!.followers}',
      ),
      UserInfoRepoDetailsPage(
        icon: const Icon(Icons.folder_shared_outlined, color: Colors.white),
        description: 'Following: ${user.user!.following}',
      ),
      user.user!.bio == null
          ? UserInfoRepoDetailsPage(
              icon: const Icon(Icons.info_outline, color: Colors.white),
              description: 'No bio',
            )
          : UserInfoRepoDetailsPage(
              icon: const Icon(Icons.info, color: Colors.white),
              description: 'About: ${user.user!.bio}',
            ),
      user.user!.location == null
          ? UserInfoRepoDetailsPage(
              icon: const Icon(Icons.location_off, color: Colors.white),
              description: 'No location stated',
            )
          : UserInfoRepoDetailsPage(
              icon: const Icon(Icons.location_on, color: Colors.white),
              description: 'Location: ${user.user!.location}',
            ),
    ],
  );
}
