import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class DioService {
  late Dio _dio;

  // Private constructor
  DioService._privateConstructor() {
    _initializeDio();
  }

  static final DioService _instance = DioService._privateConstructor();

  // Singleton instance
  static DioService get instance => _instance;

  void _initializeDio() async {
    var cacheDir = await getTemporaryDirectory();

    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: "http_request_cache",
    );

    var customCacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(hours: 1),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
    );

    _dio = Dio()
      ..interceptors.addAll([
        DioCacheInterceptor(options: customCacheOptions),
      ]);
  }
}
