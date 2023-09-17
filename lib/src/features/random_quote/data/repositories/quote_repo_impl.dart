import 'package:dartz/dartz.dart';
import 'package:quotes_app/src/core/errors/exception.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/network/network_info.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes_app/src/features/random_quote/data/datasources/random_quote_remote_date_source.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/quote_repo.dart';

class QuoteRepoImpl extends QuoteRepo {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRepoImpl({
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();

        // Caching this quote
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();

        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
