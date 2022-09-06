// ignore_for_file: non_constant_identifier_names

class User {
  String? username;
  String? imageUrl;
  int? followers;
  int? following;
  int? public_repo;
  String? joined_date;
  int? public_gists;
  String? location;
  String? company;
  String? bio;

  User({
    this.followers,
    this.username,
    this.imageUrl,
    this.following,
    this.joined_date,
    this.public_repo,
    this.bio,
    this.company,
    this.location,
    this.public_gists,
  });
}
