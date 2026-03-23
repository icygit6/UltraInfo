class Ultraman {
  final String name;
  final String origin;
  final String description;
  final String imageUrl;
  final String backgroundImage;
  final String nameImageUrl;
  final String fullDescription;
  final String height;
  final String weight;
  final String specialMove;
  final String specialMoveDescription;

  const Ultraman({
    required this.name,
    required this.origin,
    required this.description,
    String? image,
    String? imageUrl,
    String? backgroundImage,
    String? nameImageUrl,
    String? fullDescription,
    String? height,
    String? weight,
    String? specialMove,
    String? specialMoveDescription,
  }) : imageUrl = imageUrl ?? image ?? '',
       backgroundImage =
           backgroundImage ??
           'https://tsuburaya-prod.com/wp-content/uploads/2019/05/ULM_Hero_c01.png',
       nameImageUrl = nameImageUrl ?? '',
       fullDescription = fullDescription ?? description,
       height = height ?? 'Unknown',
       weight = weight ?? 'Unknown',
       specialMove = specialMove ?? 'Unknown',
       specialMoveDescription = specialMoveDescription ?? '';

  String get resolvedImageUrl {
    if (imageUrl.startsWith('http')) {
      return imageUrl;
    }
    return 'https://placehold.co/600x800/0F1A3F/E6EEFF?text=${Uri.encodeComponent(name)}';
  }
}
