part of './load_data_cubit.dart';

class LoadDataState extends Equatable {
  final ShowData loadDataShow;
  final int activePage;
  final List<UserMdl> listUsers;
  final List<UserMdl> listUsersIndexed;
  final List<RepositoryMdl> listRepositories;
  final List<RepositoryMdl> listRepositoriesIndexed;
  final List<IssueMdl> listIssues;
  final List<IssueMdl> listIssuesIndexed;
  final ParamLoadDataMdl paramsGetUsers;
  final ParamLoadDataMdl paramsGetRepositories;
  final ParamLoadDataMdl paramsGetIssues;
  final String textFieldValue;
  final LoadDataCubitType type;

  const LoadDataState({
    required this.loadDataShow,
    this.activePage = 1,
    this.listUsers = const [],
    this.listUsersIndexed = const [],
    this.listRepositories = const [],
    this.listRepositoriesIndexed = const [],
    this.listIssues = const [],
    this.listIssuesIndexed = const [],
    required this.paramsGetUsers,
    required this.paramsGetRepositories,
    required this.paramsGetIssues,
    this.textFieldValue = '',
    required this.type,
  });

  LoadDataState copyWith({
    ShowData? loadDataShow,
    int? activePage,
    List<UserMdl>? listUsers,
    List<UserMdl>? listUsersIndexed,
    List<RepositoryMdl>? listRepositories,
    List<RepositoryMdl>? listRepositoriesIndexed,
    List<IssueMdl>? listIssues,
    List<IssueMdl>? listIssuesIndexed,
    ParamLoadDataMdl? paramsGetUsers,
    ParamLoadDataMdl? paramsGetRepositories,
    ParamLoadDataMdl? paramsGetIssues,
    String? textFieldValue,
    LoadDataCubitType? type,
  }) {
    return LoadDataState(
      loadDataShow: loadDataShow ?? this.loadDataShow,
      activePage: activePage ?? this.activePage,
      listUsers: listUsers ?? this.listUsers,
      listUsersIndexed: listUsersIndexed ?? this.listUsersIndexed,
      listRepositories: listRepositories ?? this.listRepositories,
      listRepositoriesIndexed:
          listRepositoriesIndexed ?? this.listRepositoriesIndexed,
      listIssues: listIssues ?? this.listIssues,
      listIssuesIndexed: listIssuesIndexed ?? this.listIssuesIndexed,
      paramsGetUsers: paramsGetUsers ?? this.paramsGetUsers,
      paramsGetRepositories:
          paramsGetRepositories ?? this.paramsGetRepositories,
      paramsGetIssues: paramsGetIssues ?? this.paramsGetIssues,
      textFieldValue: textFieldValue ?? this.textFieldValue,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [
        loadDataShow,
        listUsers,
        textFieldValue,
        type,
        listUsersIndexed,
        listRepositoriesIndexed,
        listRepositories,
        listIssues,
        listIssuesIndexed,
        paramsGetUsers,
        paramsGetRepositories,
        paramsGetIssues,
        activePage,
      ];
}
