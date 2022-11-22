import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:search_github/widgets.dart/app_bar_theme.dart';

import '../providers/repository_provider.dart';
import '../providers/user_provider_provider.dart';
import '../widgets.dart/user_widgets/following_followers_public.dart';
import '../widgets.dart/user_widgets/user_image.dart';

class UserDetails extends StatelessWidget {
  final String username;
  const UserDetails({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const provider = Provider.of<RepositoryProvider>;
    final user = Provider.of<UserProvider>(context);
    Provider.of<UserProvider>(context).getUserProfile(username).then((_) {
      provider(context, listen: false);
    });

    return Scaffold(
        appBar: appBarTheme(title: 'User info'),
        body: user.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.black87,
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 200,
                  ),
                  UserImage(user, context),
                  UserInfoFollowingFollowersPublicRepositories(context, user),
                ]),
              ));
  }
}
