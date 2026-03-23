class Planet {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> relatedUltramans;

  const Planet({
    required this.name,
    required this.description,
    String? image,
    String? imageUrl,
    required this.relatedUltramans,
  }) : imageUrl = imageUrl ?? image ?? '';

  String get resolvedImageUrl {
    if (imageUrl.startsWith('http')) {
      return imageUrl;
    }
    return 'https://placehold.co/800x500/111B3B/E6EEFF?text=${Uri.encodeComponent(name)}';
  }
}
