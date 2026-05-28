import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cache/shared_preferences_manager.dart';
import '../../network/dio_client.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  Future<void> init() async {
    final dio = Dio();
    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<DioClient>(DioClient(dio));

    final sharedPreferences = await SharedPreferences.getInstance();
    SharedPref.sharedPreferences = sharedPreferences;
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }

  static DioClient get dioClient => getIt<DioClient>();
}
