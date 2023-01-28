import '../utils/utils.dart';
import './get_it.dart';

class Injections {
  void registerModules() {
    gt.registerLazySingleton<DioHandler>(
        () => DioHandler(apiBaseUrl: 'https://api.github.com/search/'));
  }
}
