import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final String id;
  final String content;
  final String author;
  final List<String> tags;

  const QuoteEntity({
    required this.id,
    required this.content,
    required this.author,
    required this.tags,
  });

  @override
  List<Object?> get props => [author, content, id, tags];
}
