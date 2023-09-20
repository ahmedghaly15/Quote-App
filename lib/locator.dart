import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_app/src/core/api/app_interceptors.dart';
import 'package:quotes_app/src/core/api/dio_consumer.dart';
import 'package:quotes_app/src/core/network/network_info.dart';
import 'package:quotes_app/src/core/network/network_info_impl.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/fav_datasource.dart';
import 'package:quotes_app/src/features/random_quote/data/repositories/fav_repo_impl.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/fav_repo.dart';

import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_remote_date_source.dart';
import 'package:quotes_app/src/features/random_quote/data/repositories/quote_repo_impl.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:quotes_app/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/api/api_consumer.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // Features:
  // BLocs
  serviceLocator.registerFactory<RandomQuoteCubit>(
    () => RandomQuoteCubit(
      getRandomQuoteUseCase: serviceLocator.get<GetRandomQuote>(),
      favRepo: serviceLocator.get<FavRepo>(),
    ),
  );

  // UseCases
  serviceLocator.registerLazySingleton<GetRandomQuote>(
    () => GetRandomQuote(
      quoteRepo: serviceLocator.get<QuoteRepo>(),
    ),
  );

  // Repos
  serviceLocator.registerLazySingleton<QuoteRepo>(
    () => QuoteRepoImpl(
      randomQuoteRemoteDataSource:
          serviceLocator.get<RandomQuoteRemoteDataSource>(),
      randomQuoteLocalDataSource:
          serviceLocator.get<RandomQuoteLocalDataSource>(),
      networkInfo: serviceLocator.get<NetworkInfo>(),
    ),
  );

  serviceLocator.registerLazySingleton<FavRepo>(
    () => FavRepoImpl(favDataSource: serviceLocator.get<FavDataSource>()),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(
        apiConsumer: serviceLocator.get<ApiConsumer>()),
  );

  serviceLocator.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: serviceLocator.get<SharedPreferences>(),
    ),
  );

  serviceLocator.registerLazySingleton<FavDataSource>(
    () => FavDataSourceImpl(
      favQuotes: serviceLocator.get<List<QuoteEntity>>(),
    ),
  );

  // Core:
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
    ),
  );

  serviceLocator.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: serviceLocator.get<Dio>()),
  );

  // External:
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  serviceLocator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  serviceLocator.registerLazySingleton<List<QuoteEntity>>(() => []);
  serviceLocator.registerLazySingleton<AppInterceptors>(
    () => AppInterceptors(),
  );

  serviceLocator.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
}
