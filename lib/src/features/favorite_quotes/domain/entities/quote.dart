import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author, content, permalink;
  final int id;

  const Quote({
    required this.author,
    required this.content,
    required this.permalink,
    required this.id,
  });

  @override
  List<Object?> get props => [
        author,
        content,
        permalink,
        id,
      ];
}
