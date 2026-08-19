class VenueModel {
  const VenueModel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.rating,
    this.isAvailable = true,
    this.distance,
    this.tags = const [],
  });

  final String name;
  final String location;
  final String imageUrl;
  final String price;
  final double rating;
  final bool isAvailable;
  final String? distance;
  final List<String> tags;
}
