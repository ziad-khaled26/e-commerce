class Metadata {
  const Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,});

  factory Metadata.fromJson(dynamic json) {
    return Metadata(currentPage: json['currentPage'],
        numberOfPages: json['numberOfPages'],
        limit: json['limit']);
  }

  final int currentPage;
  final int numberOfPages;
  final int limit;


}