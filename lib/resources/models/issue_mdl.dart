import 'package:github_search_app/resources/models/index.dart';
import 'package:github_search_app/utils/cast_value.dart';

class IssueMdl {
  final String url;
  final String repositoryUrl;
  final String htmlUrl;
  final int id;
  final int number;
  final String title;
  final UserMdl? user;
  final String state;
  final bool locked;
  final int comments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? closedAt;
  final String? body;

  IssueMdl({
    this.url = '',
    this.repositoryUrl = '',
    this.htmlUrl = '',
    this.id = 0,
    this.number = 0,
    this.title = '',
    this.user,
    this.state = '',
    this.locked = false,
    this.comments = 0,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'repository_url': repositoryUrl,
      'html_url': htmlUrl,
      'id': id,
      'number': number,
      'title': title,
      'user': user?.toMap(),
      'state': state,
      'locked': locked,
      'comments': comments,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'closed_at': closedAt,
      'body': body,
    };
  }

  factory IssueMdl.fromMap(Map<String, dynamic> map) {
    return IssueMdl(
      url: CastValue.toStr(map['url']),
      repositoryUrl: CastValue.toStr(map['repository_url']),
      htmlUrl: CastValue.toStr(map['html_url']),
      id: CastValue.toInteger(map['id']),
      number: CastValue.toInteger(map['number']),
      title: CastValue.toStr(map['title']),
      user: UserMdl.fromMap(CastValue.toMap(map['user'])),
      state: CastValue.toStr(map['state']),
      locked: CastValue.toBoolean(map['locked']),
      comments: CastValue.toInteger(map['comments']),
      createdAt: CastValue.toDateTime(map['created_at']),
      updatedAt: CastValue.toDateTime(map['updated_at']),
      closedAt: CastValue.toDateTime(map['closed_at']),
      body: CastValue.toStr(map['body']),
    );
  }

  IssueMdl copyWith({
    String? url,
    String? repositoryUrl,
    String? htmlUrl,
    int? id,
    int? number,
    String? title,
    UserMdl? user,
    String? state,
    bool? locked,
    int? comments,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? closedAt,
    String? body,
  }) {
    return IssueMdl(
      url: url ?? this.url,
      repositoryUrl: repositoryUrl ?? this.repositoryUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      id: id ?? this.id,
      number: number ?? this.number,
      title: title ?? this.title,
      user: user ?? this.user,
      state: state ?? this.state,
      locked: locked ?? this.locked,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      closedAt: closedAt ?? this.closedAt,
      body: body ?? this.body,
    );
  }
}
