part of 'vendor_details_bloc.dart';

sealed class VendorDetailsEvent {}

class GetVendorDetails extends VendorDetailsEvent {
  final int vendorId;

  GetVendorDetails(this.vendorId);
}

class GovernorateChangedEvent extends VendorDetailsEvent {
  final String governorate;

  GovernorateChangedEvent(this.governorate);
}

class CategoryChangedEvent extends VendorDetailsEvent {
  final String category;

  CategoryChangedEvent(this.category);
}

class WilayaChangedEvent extends VendorDetailsEvent {
  final String wilaya;

  WilayaChangedEvent(this.wilaya);
}
