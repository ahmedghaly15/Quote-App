import 'package:quotes_app/src/features/random_quote/data/datasources/fav_datasource.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';

import '../../domain/repositories/fav_repo.dart';

class FavRepoImpl extends FavRepo {
  final FavDataSource favDataSource;

  FavRepoImpl({required this.favDataSource});

  @override
  void addToFav({required QuoteEntity quote}) {
    favDataSource.addToFav(quote: quote);
  }

  @override
  void removeFromFav({required QuoteEntity quote}) {
    favDataSource.removeFromFav(quote: quote);
  }
}
