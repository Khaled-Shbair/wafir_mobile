class GetAllOffersRequest {
  final String? searchQuery;
  final int page;
  final int pageSize;

  GetAllOffersRequest({
    this.searchQuery,
    required this.page,
    required this.pageSize,
  });
}