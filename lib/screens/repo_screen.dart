import 'package:flutter/material.dart';
import 'package:search_github/providers/page_route_provider.dart';
import 'package:search_github/widgets.dart/app_bar_theme.dart';

import 'package:provider/provider.dart';

import '../providers/repository_provider.dart';

import '../widgets.dart/repo_screen_widgets/author_and_repo_name.dart';
import '../widgets.dart/repo_screen_widgets/fork_and_issuses_count.dart';
import '../widgets.dart/repo_screen_widgets/open_repository_button.dart';
import '../widgets.dart/repo_screen_widgets/open_user_profile.dart';
import '../widgets.dart/repo_screen_widgets/repository_description.dart';

class RepoScreen extends StatefulWidget {
  final String repos;
  const RepoScreen({Key? key, required this.repos}) : super(key: key);
  @override
  State<RepoScreen> createState() => _RepoScreenState();
}

class _RepoScreenState extends State<RepoScreen> {
  final controller = ScrollController();
  var page = 2;
  var _init = true;

  bool isSorted = false;
  final provider = Provider.of<RepositoryProvider>;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      provider(context).isLoading = true;

      Provider.of<RepositoryProvider>(context)
          .getRepoList(repo: widget.repos)
          .then((_) {
        provider(context, listen: false).isLoading = false;
        if (widget.repos.length < 25) {
          provider(context, listen: false).hasMore = false;
        }
      });
    }
    _init = false;
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (widget.repos.length < 25) {
          provider(context, listen: false).hasMore = false;
          provider(context, listen: false).isLoading = false;
        }
      }
      @override
      void dispose() {
        // TODO: implement dispose
        super.dispose();
        controller.dispose();
      }

      Provider.of<RepositoryProvider>(context, listen: false)
          .getRepoList(repo: widget.repos, page: page++)
          .then((_) {
        provider(context, listen: false).hasMore = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<RepositoryProvider>(context);
    final route = Provider.of<onPressedProvider>(context);

    return Scaffold(
      appBar: appBarTheme(
        title: 'Repositories',
      ),
      body: provider(context).isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.black87,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.repos,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Total results: ${repo.count}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isSorted = !isSorted;
                        });
                      },
                      icon: const Icon(Icons.sort),
                      label: Text(
                        isSorted ? 'Sort alphabetically' : 'Sort by stars',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      itemCount: repo.repoList.length + 1,
                      itemBuilder: (context, index) {
                        if (index < repo.repoList.length) {
                          final sorted = isSorted
                              ? repo.sortedByStars
                              : repo.sortedByAlphaList;
                          final repos = sorted[index];
                          return InkWell(
                            hoverColor: Colors.grey,
                            child: Card(
                              color: const Color.fromRGBO(51, 51, 51, 0),
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: OpenUserProfileWidget(
                                          route, repo, index, context, repos),
                                      title: AuthorAndRepoName(
                                        repos,
                                        index,
                                        repo,
                                      ),
                                      subtitle: RepoDescription(
                                        repos,
                                        index,
                                        repo,
                                      ),
                                      trailing: ForkAndIssuesCount(
                                          repos, index, repo),
                                    ),
                                  ),
                                  OpenRepositoryButton(
                                    context,
                                    repos,
                                    index,
                                    route,
                                    repo,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                                child: !provider(context).hasMore
                                    ? const Text('No more data to load')
                                    : const CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
