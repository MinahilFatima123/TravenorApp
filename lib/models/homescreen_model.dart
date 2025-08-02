class Destination {
  final String imagePath;
  final String name;
  final String location;
  final double rating;
  final List<String> visitors;
  final double pricePerPerson;
  final int totalReviews;
  final List<String> pictures;
  final String about;

  Destination({
    required this.imagePath,
    required this.name,
    required this.location,
    required this.rating,
    required this.visitors,
    required this.pricePerPerson,
    required this.totalReviews,
    required this.pictures,
    required this.about,
  });
}
