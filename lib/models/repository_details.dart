// ignore_for_file: non_constant_identifier_names

class RepositoryDetails {
  final String? description;
  final String? reponame;
  final String? full_name;
  final int? stars;
  final int? id;
  final String? url;
  final String? author;
  final int? fork_count;
  final int? issue_count;
  final String? avatarUrl;
  final String? default_branch;
  final String? created_date;
  final String? last_pushed;
  final int? watchers_count;
  final String? language;

  RepositoryDetails({
    this.id,
    this.reponame,
    this.description,
    this.stars,
    this.url,
    this.author,
    this.fork_count,
    this.issue_count,
    this.avatarUrl,
    this.created_date,
    this.default_branch,
    this.full_name,
    this.last_pushed,
    this.watchers_count,
    this.language,
  });
}
