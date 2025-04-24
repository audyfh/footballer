import 'package:dio/dio.dart';
import 'package:footballer/core/secret/secret.dart';
import 'package:footballer/features/football/data/remote/football_remote.dart';
import 'package:footballer/features/football/data/repositories/footballrepo_impl.dart';
import 'package:footballer/features/football/domain/repositories/footballrepo.dart';
import 'package:footballer/features/football/domain/usecases/get_todaymatches_usecase.dart';
import 'package:footballer/features/football/presentation/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final supabase = await Supabase.initialize(url: Secret.supabaseUrl, anonKey: Secret.supabaseKey);
  sl.registerLazySingleton(() => supabase.client);
  
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.headers['X-Auth-Token'] = Secret.fooballApiKey;
    dio.options.headers['Content-Type'] = 'application/json';
    return dio;
  });

  _initFootball();
}

void _initFootball() {
  sl.registerLazySingleton<FootballRemote>(() => FootballRemoteImpl(dio: sl()));

  sl.registerLazySingleton<FootBallRepo>(() => FootballRepoImpl(footballRemote: sl()));

  sl.registerLazySingleton(() => GetTodayMatchesUseCase(sl()));

  sl.registerLazySingleton(() => HomeBloc(getTodayMatchesUseCase: sl()));
}
