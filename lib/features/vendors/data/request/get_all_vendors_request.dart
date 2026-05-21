class GetAllVendorsRequest {
  final int page;
  final String? q;
  final String? sector;
  final String? city;
  final String? discount;
  final String? sort;
  final int? vendorId;

  GetAllVendorsRequest({
    required this.page,
    this.q,
    this.sector,
    this.city,
    this.discount,
    this.sort,
    this.vendorId,
  });
}
