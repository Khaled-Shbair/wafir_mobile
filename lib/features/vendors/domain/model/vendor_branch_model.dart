class  VendorBranchModel {
  final int id;
  final String name;
  final String city;
  final String address;
  final String latitude;
  final String longitude;
  final bool isMain;
  final String status;

  const  VendorBranchModel({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.isMain,
  });
}
