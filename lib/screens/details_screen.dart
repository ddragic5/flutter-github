// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:search_github/providers/on_tap%20provider.dart';

import '../providers/repository_details_provider.dart';
import '../providers/repository_provider.dart';
import '../providers/user_provider_provider.dart';
import '../widgets.dart/app_bar_theme.dart';
import '../widgets.dart/details_page_widgets/author_image_name/author_image_name_column.dart';

import '../widgets.dart/details_page_widgets/red_button.dart';

import '../widgets.dart/details_page_widgets/repo_details/repo_botom_bar.dart';
import '../widgets.dart/details_page_widgets/repo_main_container/main_container.dart';
import '../widgets.dart/details_page_widgets/user_details_page.dart/user_info.dart';

class RepositoryDetails extends StatefulWidget {
  final String? username;
  final String full_name;
  const RepositoryDetails({Key? key, this.username, required this.full_name})
      : super(key: key);

  @override
  State<RepositoryDetails> createState() => _RepositoryDetailsState();
}

class _RepositoryDetailsState extends State<RepositoryDetails> {
  final provider = Provider.of<RepositoryProvider>;
  var _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_init) {
      provider(context).isLoading = true;

      Provider.of<RepositoryDetailsProvider>(context)
          .detailedRepository('${widget.full_name}')
          .then((_) {
        provider(context, listen: false).isLoading = false;
      });
      Provider.of<UserProvider>(context)
          .getUserProfile('${widget.username}')
          .then(
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
    final repo = Provider.of<RepositoryDetailsProvider>(context);
    final user = Provider.of<UserProvider>(context);
    final dateF = DateFormat.yMMMd('en_US');
    final repoUrl = Provider.of<onTapProvider>(context);
    return Scaffold(
        appBar: appBarTheme(title: widget.full_name),
        body: provider(context).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.black87,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AuthorImageAndName(context, repo),
                          Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 100),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(51, 51, 51, 0),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 200,
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: UserInfoDetailsPage(
                                        dateF, user, context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MainContainerView(dateF, repo, context),
                      RedButtonDetailsPage(repoUrl, repo),
                      RepoInfoBottomContainer(repo),
                    ],
                  ),
                ),
              ));
  }
}
