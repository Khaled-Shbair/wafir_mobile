class OfferClaimModel {
  final int id;
  final int userId;
  final int offerId;
  final String claimCode;
  final String status;
  final String redeemedAt;
  final String expiresAt;
  final String createdAt;
  final String redemptionType;
  final String whatsappNumber;
  final String whatsappMessageTemplate;
  final String vendorPrimaryPhoneNumber;
  final String message;
  final String path;
  final bool success;

  const OfferClaimModel({
	required this.id,
	required this.success,
	required this.userId,
	required this.offerId,
	required this.claimCode,
	required this.status,
	required this.redeemedAt,
	required this.expiresAt,
	required this.createdAt,
	required this.redemptionType,
	required this.whatsappNumber,
	required this.whatsappMessageTemplate,
	required this.vendorPrimaryPhoneNumber,
	required this.message,
	required this.path,
  });
}

