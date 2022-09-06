// ignore_for_file: non_constant_identifier_names

class Repository {
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
  final String? topics;
  final String? created_date;
  final String? last_pushed;
  final int? watchers_count;
  final String? language;
  final int? total_count;

  Repository({
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
    this.topics,
    this.watchers_count,
    this.language,
    this.total_count,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      reponame: json['name'],
      stars: json['stargazers_count'],
      description: json['description'],
      url: json['html_url'],
      fork_count: json['forks_count'],
      issue_count: json['open_issues_count'],
      author: json['owner']['login'],
      avatarUrl: json['owner']['avatar_url'],
      full_name: json['full_name'],
    );
  }
}
