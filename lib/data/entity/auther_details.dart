class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final double rating;

  AuthorDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        username = json['username'] ?? "",
        avatarPath = json['avatar_path'] ?? "",
        rating = json['rating'] ?? 0.0;

  static List<AuthorDetails> parssJsonArrayAuther(List<dynamic> jsonArray) {
    final List<AuthorDetails> items = [];

    for (var json in jsonArray) {
      items.add(AuthorDetails.fromJson(json));
      items.toList();
    }
    return items;
  }
}
