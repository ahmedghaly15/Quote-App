import 'package:dartz/dartz.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCases<String, NoParams> {
  final LangRepository langRepository;

  const GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await langRepository.getSavedLang();
  }
}
