import '../../domain/entities/quote_entity.dart';

abstract class FavDataSource {
  void addToFav({required QuoteEntity quote});
  void removeFromFav({required QuoteEntity quote});
}

class FavDataSourceImpl implements FavDataSource {
  final List<QuoteEntity> favQuotes;

  const FavDataSourceImpl({required this.favQuotes});

  @override
  void addToFav({required QuoteEntity quote}) {
    favQuotes.add(quote);
  }

  @override
  void removeFromFav({required QuoteEntity quote}) {
    favQuotes.remove(quote);
  }
}
