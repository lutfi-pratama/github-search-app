import 'package:equatable/equatable.dart';

import 'package:github_search_app/resources/models/index.dart';

import '../../utils/utils.dart';

class RepositoryMdl extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final bool private;
  final UserMdl? owner;
  final String htmlUrl;
  final String? description;
  final String url;
  final String visibility;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final int stargazersCount;
  final int watchersCount;
  final String? language;

  const RepositoryMdl({
    this.id = 0,
    this.name = '',
    this.fullName = '',
    this.private = false,
    this.owner,
    this.htmlUrl = '',
    this.description,
    this.url = '',
    this.visibility = '',
    this.updatedAt,
    this.pushedAt,
    this.stargazersCount = 0,
    this.watchersCount = 0,
    this.language,
  });

  RepositoryMdl copyWith({
    int? id,
    String? name,
    String? fullName,
    bool? private,
    UserMdl? owner,
    String? htmlUrl,
    String? description,
    String? url,
    String? visibility,
    DateTime? updatedAt,
    DateTime? pushedAt,
    int? stargazersCount,
    int? watchersCount,
    String? language,
  }) {
    return RepositoryMdl(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      owner: owner ?? this.owner,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      description: description ?? this.description,
      url: url ?? this.url,
      visibility: visibility ?? this.visibility,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'full_name': fullName,
      'private': private,
      'owner': owner?.toMap(),
      'html_url': htmlUrl,
      'description': description,
      'url': url,
      'visibility': visibility,
      'update_at': updatedAt,
      'pushed_at': pushedAt,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
    };
  }

  factory RepositoryMdl.fromMap(Map<String, dynamic> map) {
    return RepositoryMdl(
      id: CastValue.toInteger(map['id']),
      name: CastValue.toStr(map['name']),
      fullName: CastValue.toStr(map['full_name']),
      private: CastValue.toBoolean(map['private']),
      owner: UserMdl.fromMap(CastValue.toMap(map['owner'])),
      htmlUrl: CastValue.toStr(map['html_url']),
      description: map['description'] != null
          ? CastValue.toStr(map['description'])
          : null,
      url: CastValue.toStr(map['url']),
      visibility: CastValue.toStr(map['visibility']),
      updatedAt: CastValue.toDateTime(map['update_at']),
      pushedAt: CastValue.toDateTime(map['pushed_at']),
      stargazersCount: CastValue.toInteger(map['stargazers_count']),
      watchersCount: CastValue.toInteger(map['watchers_count']),
      language:
          map['language'] != null ? CastValue.toStr(map['language']) : null,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      fullName,
      private,
      owner,
      htmlUrl,
      description,
      url,
      visibility,
      updatedAt,
      pushedAt,
      stargazersCount,
      watchersCount,
      language,
    ];
  }
}
