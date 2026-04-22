class OfferVendorBranchModel {
  final int id;
  final String governorate;
  final String wilaya;
  final String address;
  final String phoneNumber;
  final bool isMain;

  OfferVendorBranchModel({
    required this.id,
    required this.wilaya,
    required this.governorate,
    required this.address,
    required this.phoneNumber,
    required this.isMain,
  });
}
