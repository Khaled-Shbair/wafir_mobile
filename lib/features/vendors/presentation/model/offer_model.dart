class OfferModel {
  final String title;
  final String subtitle;
  final String price;
  final String oldPrice;
  final String discount;
  final String imageUrl;

  const OfferModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.imageUrl,
  });
}
