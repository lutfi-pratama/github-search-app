import 'package:equatable/equatable.dart';
import '../../utils/utils.dart';

class UserMdl extends Equatable {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String starredUrl;
  final String reposUrl;
  final String type;

  const UserMdl({
    this.login = '',
    this.id = 0,
    this.nodeId = '',
    this.avatarUrl = '',
    this.htmlUrl = '',
    this.followersUrl = '',
    this.followingUrl = '',
    this.starredUrl = '',
    this.reposUrl = '',
    this.type = '',
  });

  UserMdl copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? starredUrl,
    String? reposUrl,
    String? type,
  }) {
    return UserMdl(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'starred_url': starredUrl,
      'repos_url': reposUrl,
      'type': type,
    };
  }

  factory UserMdl.fromMap(Map<String, dynamic> map) {
    return UserMdl(
      login: CastValue.toStr(map['login']),
      id: CastValue.toInteger(map['id']),
      nodeId: CastValue.toStr(map['node_id']),
      avatarUrl: CastValue.toStr(map['avatar_url']),
      htmlUrl: CastValue.toStr(map['html_url']),
      followersUrl: CastValue.toStr(map['followers_url']),
      followingUrl: CastValue.toStr(map['following_url']),
      starredUrl: CastValue.toStr(map['starred_url']),
      reposUrl: CastValue.toStr(map['repos_url']),
      type: CastValue.toStr(map['type']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      login,
      id,
      nodeId,
      avatarUrl,
      htmlUrl,
      followersUrl,
      followingUrl,
      starredUrl,
      reposUrl,
      type,
    ];
  }
}
