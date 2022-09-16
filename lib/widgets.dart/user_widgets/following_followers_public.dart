// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../providers/user_provider_provider.dart';
import '../../screens/user_followers_screen.dart';
import '../../screens/user_following_screen.dart';

Column UserInfoFollowingFollowersPublicRepositories(
    BuildContext context, UserProvider user) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => UserFollowingScreen(
                            username: '${user.user!.username}'),
                      ),
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.person_add_sharp, color: Colors.greenAccent),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Following',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  user.user!.following.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => UserFollowersScreen(
                          username: '${user.user!.username}',
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.local_fire_department,
                          color: Colors.greenAccent),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Followers',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  ' ${user.user!.followers}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Icon(Icons.public, color: Colors.greenAccent),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Public Repositories',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Text(
                  user.user!.public_repo.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ],
  );
}
