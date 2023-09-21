import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/splash/domain/usecases/change_lang.dart';
import 'package:quotes_app/src/features/splash/domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;

  LocaleCubit({
    required this.getSavedLangUseCase,
    required this.changeLangUseCase,
  }) : super(
          const ChangeLocaleState(Locale(AppStrings.englishCode)),
        );

  String currentLang = AppStrings.englishCode;

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) {
      debugPrint(AppStrings.cacheFailure);
    }, (value) {
      currentLang = value!;
      emit(ChangeLocaleState(Locale(currentLang)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) {
      debugPrint(AppStrings.cacheFailure);
    }, (value) {
      currentLang = langCode;
      emit(ChangeLocaleState(Locale(currentLang)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);

  void toArabic() => _changeLang(AppStrings.arabicCode);
}
