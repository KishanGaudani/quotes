
class QuoteData {
  final String quote;
  final String author;
  final String category;

  QuoteData({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuoteData.fromMap({required Map e}) {
    return QuoteData(
      quote: e["quote"],
      author: e["author"],
      category: e["category"],
    );
  }
}