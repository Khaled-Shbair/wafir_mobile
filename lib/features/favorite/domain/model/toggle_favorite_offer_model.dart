class ToggleFavoriteOfferModel {
  final bool success;
  final String message;
  final bool isFavorited;

  ToggleFavoriteOfferModel({
    required this.message,
    required this.success,
    required this.isFavorited,
  });
}
