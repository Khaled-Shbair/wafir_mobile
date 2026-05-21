class GetAllOffersRequest {
  final int page;
  final int take;
  final String? q;
  final String? sector;
  final String? city;
  final String? discount;
  final String? sort;
  final int? vendorId;

  GetAllOffersRequest({
    required this.page,
    required this.take,
    this.q,
    this.sector,
    this.city,
    this.discount,
    this.sort,
    this.vendorId,
  });
}