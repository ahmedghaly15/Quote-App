import 'package:dartz/dartz.dart';
import 'package:quotes_app/src/core/errors/exception.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/features/splash/data/datasources/lang_locale_data_source.dart';
import 'package:quotes_app/src/features/splash/domain/repositories/lang_repository.dart';

class LangRepoImpl implements LangRepository {
  final LangLocaleDataSource langLocaleDataSource;

  const LangRepoImpl({required this.langLocaleDataSource});

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final languageCode =
          await langLocaleDataSource.changeLang(langCode: langCode);

      return Right(languageCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedLang() async {
    try {
      final savedLang = await langLocaleDataSource.getSavedLang();
      return Right(savedLang);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
