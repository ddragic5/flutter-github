import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_github/providers/on_tap%20provider.dart';
import 'package:search_github/providers/page_route_provider.dart';

import 'package:search_github/providers/repository_details_provider.dart';
import 'package:search_github/providers/repository_provider.dart';
import 'package:search_github/providers/user_followers_provider.dart';
import 'package:search_github/providers/user_following_provider.dart';
import 'package:search_github/providers/user_provider_provider.dart';

import 'package:search_github/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: RepositoryProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RepositoryDetailsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserFollowerProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserFollowingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: onTapProvider(),
        ),
        ChangeNotifierProvider.value(
          value: onPressedProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Github',
        home: (SearchScreem()),
      ),
    );
  }
}
