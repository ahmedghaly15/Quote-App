import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_app/src/core/network/network_info.dart';
import 'package:quotes_app/src/core/network/network_info_impl.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_remote_date_source.dart';
import 'package:quotes_app/src/features/random_quote/data/repositories/quote_repo_impl.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:quotes_app/src/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final GetIt serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // Features:
  // BLocs
  serviceLocator.registerFactory<RandomQuoteCubit>(
    () => RandomQuoteCubit(
      getRandomQuoteUseCase: serviceLocator.get<GetRandomQuote>(),
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

  // Data Sources
  serviceLocator.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(client: serviceLocator.get<Client>()),
  );

  serviceLocator.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(
      sharedPreferences: serviceLocator.get<SharedPreferences>(),
    ),
  );

  // Core:
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
    ),
  );

  // External:
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  serviceLocator.registerLazySingleton<Client>(() => http.Client());
  serviceLocator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
}
