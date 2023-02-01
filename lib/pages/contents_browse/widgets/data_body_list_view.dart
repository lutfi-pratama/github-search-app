import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_search_app/cubits/load_data/load_data_cubit.dart';
import 'package:github_search_app/pages/contents_browse/widgets/index.dart';

class DataBodyListView extends StatelessWidget {
  DataBodyListView(
      {Key? key,
      this.isIndexView = false,
      required this.loadDataState,
      required this.type})
      : super(key: key);

  bool isIndexView;
  LoadDataType type;
  LoadDataState loadDataState;

  @override
  Widget build(BuildContext context) {
    final lengthDataList = type == LoadDataType.users
        ? loadDataState.listUsers.length
        : type == LoadDataType.repos
            ? loadDataState.listRepositories.length
            : loadDataState.listIssues.length;

    final lengthDataListIndexed = type == LoadDataType.users
        ? loadDataState.listUsersIndexed.length
        : type == LoadDataType.repos
            ? loadDataState.listRepositoriesIndexed.length
            : loadDataState.listIssuesIndexed.length;

    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.w),
        separatorBuilder: (_, __) => SizedBox(
              height: 15.w,
            ),
        itemCount: !isIndexView ? lengthDataList : lengthDataListIndexed,
        itemBuilder: (_, index) {
          if (type == LoadDataType.users) {
            return ProfileCard(
              user: !isIndexView
                  ? loadDataState.listUsers[index]
                  : loadDataState.listUsersIndexed[index],
            );
          } else if (type == LoadDataType.repos) {
            return RepositoryCard(
              repository: !isIndexView
                  ? loadDataState.listRepositories[index]
                  : loadDataState.listRepositoriesIndexed[index],
            );
          } else if (type == LoadDataType.issues) {
            return IssueCard(
              issue: !isIndexView
                  ? loadDataState.listIssues[index]
                  : loadDataState.listIssuesIndexed[index],
            );
          }
          return const SizedBox();
        });
  }
}
