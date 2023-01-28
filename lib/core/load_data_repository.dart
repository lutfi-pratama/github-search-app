import '../resources/models/index.dart';

abstract class LoadDataRepository {
  Future<BaseResponseMdl<dynamic>> loadData(
      {required ParamLoadDataMdl params, required String path});
}
