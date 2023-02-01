import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:github_search_app/core/load_data_repository.dart';
import 'package:github_search_app/resources/models/index.dart';
import 'package:github_search_app/utils/utils.dart';
import 'dart:developer';

part './load_data_state.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit({required this.repository})
      : super(LoadDataState(
          loadDataStatus: DataStatus.init(),
          type: LoadDataType.users,
          paramsGetUsers: const ParamLoadDataMdl(
            page: 1,
            limit: 2,
            search: '',
          ),
          paramsGetRepositories: const ParamLoadDataMdl(
            page: 1,
            limit: 2,
            search: '',
          ),
          paramsGetIssues: const ParamLoadDataMdl(
            page: 1,
            limit: 2,
            search: '',
          ),
        ));

  LoadDataRepository repository;

  bool get isAbleToNextPage =>
      state.paramsGetUsers.page >= 1 &&
      state.paramsGetRepositories.page >= 1 &&
      state.paramsGetIssues.page >= 1;

  Future<void> onLoadDataList({String selectedMenuItemName = ''}) async {
    emit(state.copyWith(
      loadDataStatus: DataStatus.loading(),
      paramsGetUsers:
          state.paramsGetUsers.copyWith(search: state.textFieldValue),
      paramsGetRepositories:
          state.paramsGetRepositories.copyWith(search: state.textFieldValue),
      paramsGetIssues:
          state.paramsGetIssues.copyWith(search: state.textFieldValue),
    ));

    try {
      String networkPath = _getNetworkPath(selectedMenuItemName);
      ParamLoadDataMdl params = _getNetworkParams();

      final res = await repository.loadData(params: params, path: networkPath);

      if (state.type == LoadDataType.users) {
        _setResponseDataUsers(res);
      } else if (state.type == LoadDataType.repos) {
        _setResponseDataRepositories(res);
      } else if (state.type == LoadDataType.issues) {
        _setResponseDataIssues(res);
      }
    } on DioError catch (e) {
      emit(
          state.copyWith(loadDataStatus: DataStatus.error(message: e.message)));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: DataStatus.error(message: '$e')));
    } finally {
      emit(state.copyWith(loadDataStatus: DataStatus.init()));
    }
  }

  ParamLoadDataMdl _getNetworkParams() {
    ParamLoadDataMdl params = const ParamLoadDataMdl();
    if (state.type == LoadDataType.users) {
      params = state.paramsGetUsers;
    } else if (state.type == LoadDataType.repos) {
      params = state.paramsGetRepositories;
    } else if (state.type == LoadDataType.issues) {
      params = state.paramsGetIssues;
    }
    return params;
  }

  String _getNetworkPath(String menuItemName) {
    String networkPath = '';
    if (state.type == LoadDataType.users) {
      networkPath = 'users';
    } else if (state.type == LoadDataType.repos) {
      networkPath = 'repositories';
    } else if (state.type == LoadDataType.issues) {
      networkPath = 'issues';
    }
    return networkPath;
  }

  void _setResponseDataUsers(BaseResponseMdl<dynamic> response) {
    final usersList = CastValue.toListOfObject<UserMdl>(
        value: response.items, fromMap: UserMdl.fromMap);

    _saveCurrentPageUsersList(usersList);

    final updatedUserslist = _getAppendedCurrentUsersWithNewUsers(usersList);

    emit(state.copyWith(
      loadDataStatus: DataStatus.success(),
      listUsers: updatedUserslist,
      listUsersIndexed: usersList,
    ));
  }

  void _setResponseDataRepositories(BaseResponseMdl<dynamic> response) {
    final repositoriesList = CastValue.toListOfObject<RepositoryMdl>(
        value: response.items, fromMap: RepositoryMdl.fromMap);

    _saveCurrentPageRepositoriesList(repositoriesList);

    final updatedRepositorieslist =
        _getAppendedCurrentReposWithNewRepos(repositoriesList);

    emit(state.copyWith(
      loadDataStatus: DataStatus.success(),
      listRepositories: updatedRepositorieslist,
      listRepositoriesIndexed: repositoriesList,
    ));
  }

  void _setResponseDataIssues(BaseResponseMdl<dynamic> response) {
    final issuesList = CastValue.toListOfObject<IssueMdl>(
        value: response.items, fromMap: IssueMdl.fromMap);

    log('lg setResponse--> ${issuesList[0]}'); //!

    _saveCurrentPageIssuesList(issuesList);

    final updatedIssueslist =
        _getAppendedCurrentIssuesWithNewIssues(issuesList);

    emit(state.copyWith(
      loadDataStatus: DataStatus.success(),
      listIssues: updatedIssueslist,
      listIssuesIndexed: issuesList,
    ));
  }

  List<UserMdl> _getAppendedCurrentUsersWithNewUsers(List<UserMdl> newData) {
    final currentData = List<UserMdl>.of(newData);
    var updatedData = List<UserMdl>.of(state.listUsers)..addAll(currentData);
    updatedData = ListHelper.getUniqueItem(list: updatedData);

    return updatedData;
  }

  List<RepositoryMdl> _getAppendedCurrentReposWithNewRepos(
      List<RepositoryMdl> newData) {
    final currentData = List<RepositoryMdl>.of(newData);
    var updatedData = List<RepositoryMdl>.of(state.listRepositories)
      ..addAll(currentData);
    updatedData = ListHelper.getUniqueItem(list: updatedData);

    return updatedData;
  }

  List<IssueMdl> _getAppendedCurrentIssuesWithNewIssues(
      List<IssueMdl> newData) {
    final currentData = List<IssueMdl>.of(newData);
    var updatedData = List<IssueMdl>.of(state.listIssues)..addAll(currentData);
    updatedData = ListHelper.getUniqueItem(list: updatedData);

    return updatedData;
  }

  void _saveCurrentPageUsersList(List<UserMdl> listUsers) {
    emit(state.copyWith(listUsersIndexed: listUsers));
  }

  void _saveCurrentPageRepositoriesList(List<RepositoryMdl> repoList) {
    emit(state.copyWith(listRepositoriesIndexed: repoList));
  }

  void _saveCurrentPageIssuesList(List<IssueMdl> issueList) {
    emit(state.copyWith(listIssuesIndexed: issueList));
  }

  void onTextFieldChange(String textValue) {
    emit(state.copyWith(textFieldValue: textValue));
  }

  void onNextPage() {
    if (!isAbleToNextPage) return;

    if (state.type == LoadDataType.users) {
      int nextPage = state.paramsGetUsers.page + 1;
      emit(state.copyWith(
          paramsGetUsers: state.paramsGetUsers.copyWith(page: nextPage)));
    } else if (state.type == LoadDataType.repos) {
      int nextPage = state.paramsGetRepositories.page + 1;
      emit(state.copyWith(
          paramsGetRepositories:
              state.paramsGetRepositories.copyWith(page: nextPage)));
    } else if (state.type == LoadDataType.issues) {
      int nextPage = state.paramsGetIssues.page + 1;
      emit(state.copyWith(
          paramsGetIssues: state.paramsGetIssues.copyWith(page: nextPage)));
    }

    _onChangeActivePage();
  }

  void onBackPage() {
    if (state.type == LoadDataType.users && state.paramsGetUsers.page > 1) {
      int priorPage = state.paramsGetUsers.page - 1;
      emit(state.copyWith(
          paramsGetUsers: state.paramsGetUsers.copyWith(page: priorPage)));
    } else if (state.type == LoadDataType.repos &&
        state.paramsGetRepositories.page > 1) {
      int priorPage = state.paramsGetRepositories.page - 1;
      emit(state.copyWith(
          paramsGetRepositories:
              state.paramsGetRepositories.copyWith(page: priorPage)));
    } else if (state.type == LoadDataType.issues &&
        state.paramsGetIssues.page > 1) {
      int priorPage = state.paramsGetIssues.page - 1;
      emit(state.copyWith(
          paramsGetIssues: state.paramsGetIssues.copyWith(page: priorPage)));
    }

    _onChangeActivePage();
  }

  void onChangeType(LoadDataType typePick) {
    emit(state.copyWith(type: typePick));

    _onChangeActivePage();
  }

  int getCurrentIndexedForPageView() {
    if (state.type == LoadDataType.users) {
      return state.paramsGetUsers.page;
    } else if (state.type == LoadDataType.repos) {
      return state.paramsGetRepositories.page;
    }
    return state.paramsGetIssues.page;
  }

  void considerLoadDataOnBackIndex(String selectedItem) {
    if (state.paramsGetUsers.page > 1) {
      onLoadDataList(selectedMenuItemName: selectedItem);
    }
    if (state.paramsGetRepositories.page > 1) {
      onLoadDataList(selectedMenuItemName: selectedItem);
    }
    if (state.paramsGetIssues.page > 1) {
      onLoadDataList(selectedMenuItemName: selectedItem);
    }
  }

  void _onChangeActivePage() {
    if (state.type == LoadDataType.users) {
      emit(state.copyWith(activePage: state.paramsGetUsers.page));
    } else if (state.type == LoadDataType.repos) {
      emit(state.copyWith(activePage: state.paramsGetRepositories.page));
    } else if (state.type == LoadDataType.issues) {
      emit(state.copyWith(activePage: state.paramsGetIssues.page));
    }
  }

  void clearAllLoadedData() {
    emit(state.copyWith(
      listUsers: [],
      listUsersIndexed: [],
      listRepositories: [],
      listRepositoriesIndexed: [],
      paramsGetUsers: const ParamLoadDataMdl(
        search: '',
      ),
      paramsGetRepositories: const ParamLoadDataMdl(
        search: '',
      ),
      paramsGetIssues: const ParamLoadDataMdl(
        search: '',
      ),
    ));
  }
}

enum LoadDataType { users, repos, issues }
