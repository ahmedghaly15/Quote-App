import 'package:dartz/dartz.dart';

import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/features/splash/domain/repositories/lang_repository.dart';

import '../../../../core/usecases/usecases.dart';

class ChangeLangUseCase implements UseCases<bool, String> {
  final LangRepository langRepository;

  const ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(langCode: langCode);
  }
}
