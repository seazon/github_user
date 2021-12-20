class GithubUserResult {
  bool incomplete_results;
  List<GithubUserResultItem>? items;
  int total_count;

  GithubUserResult({required this.incomplete_results, required this.items, required this.total_count});

  factory GithubUserResult.fromJson(Map<String, dynamic> json) {
    return GithubUserResult(
      incomplete_results: json['incomplete_results'],
      items: json['items'] != null
          ? (json['items'] as List)
              .map((i) => GithubUserResultItem.fromJson(i))
              .toList()
          : null,
      total_count: json['total_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['incomplete_results'] = this.incomplete_results;
    data['total_count'] = this.total_count;
    if (this.items != null) {
      data['items'] = this.items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GithubUserResultItem {
  int id;
  String login;
  String avatar_url;

  GithubUserResultItem({
    required this.id,
    required this.login,
    required this.avatar_url,
  });

  factory GithubUserResultItem.fromJson(Map<String, dynamic> json) {
    return GithubUserResultItem(
      id: json['id'],
      login: json['login'],
      avatar_url: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = this.id;
    data['login'] = this.login;
    data['avatar_url'] = this.avatar_url;
    return data;
  }
}
