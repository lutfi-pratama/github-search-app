import 'package:github_search_app/resources/enums/index.dart';
import '../utils/network/api_services/api_services.dart';
import './load_data_repository.dart';
import '../resources/models/index.dart';

class LoadDataRepositoryExe implements LoadDataRepository {
  @override
  Future<BaseResponseMdl<dynamic>> loadData(
      {required ParamLoadDataMdl params, required String path}) async {
    final response = await ApiServices.request(
        path: path.toLowerCase(),
        method: HttpMethod.get,
        queryParameters: params.toMap());
    if (response.data != null) {
      final res = response.data;
      return res!;
    } else {
      return throw Exception('failed to load data Users');
    }
  }
}
