import 'package:wafir_mobile/features/vendors/domain/model/sector_model.dart';

class GetVendorDetailsModel {
  final bool success;
  final int statusCode;
  final String timestamp;
  final String path;
  final String message;
  final VendorModel data;

  GetVendorDetailsModel({
    required this.success,
    required this.statusCode,
    required this.timestamp,
    required this.path,
    required this.message,
    required this.data,
  });
}

class VendorModel {
  final int id;
  final String businessName;

  final String description;

  final String websiteUrl;
  final String instagramUrl;
  final String facebookUrl;
  final String tiktokUrl;
  final String snapchatUrl;
  final String workingHours;
  final String iconUrl;
  final bool status;
  final List offers;
  final List branches;
  final SectorModel sector;

  VendorModel({
    required this.id,
    required this.sector,
    required this.branches,
    required this.iconUrl,
    required this.tiktokUrl,
    required this.workingHours,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.snapchatUrl,
    required this.websiteUrl,
    required this.businessName,
    required this.description,
    required this.status,
    required this.offers,
  });
}
