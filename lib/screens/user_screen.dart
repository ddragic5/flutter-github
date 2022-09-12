import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:search_github/widgets.dart/app_bar_theme.dart';

import '../providers/repository_provider.dart';
import '../providers/user_provider_provider.dart';
import '../widgets.dart/user_widgets/following_followers_public.dart';
import '../widgets.dart/user_widgets/user_image.dart';

class UserDetails extends StatefulWidget {
  final String username;
  const UserDetails({Key? key, required this.username}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  var _init = true;
  final provider = Provider.of<RepositoryProvider>;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      setState(() {
        provider(context, listen: false).isLoading = false;
      });

      Provider.of<UserProvider>(context).getUserProfile(widget.username).then(
        (_) {
          provider(context, listen: false).isLoading = false;
        },
      );
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    const provider = Provider.of<RepositoryProvider>;
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: appBarTheme(title: 'User info'),
        body: provider(context).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.black87,
                child: Column(children: <Widget>[
                  const SizedBox(
                    height: 200,
                  ),
                  UserImage(user),
                  UserInfoFollowingFollowersPublicRepositories(context, user),
                ]),
              ));
  }
}
