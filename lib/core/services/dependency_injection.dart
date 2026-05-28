import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_client.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  Future<void> init() async {
    // Initialize Dio
    final dio = Dio();
    getIt.registerSingleton<DioClient>(DioClient(dio));
    getIt.registerSingleton<Dio>(dio);

    // SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);


    // getIt.registerLazySingleton<StatisticsRepository>(
    //       () => StatisticsRepository(getIt()),
    // );
    // getIt.registerFactory<StatisticsCubit>(() => StatisticsCubit(getIt()));
  }

  static DioClient get dioClient => getIt<DioClient>();
}
