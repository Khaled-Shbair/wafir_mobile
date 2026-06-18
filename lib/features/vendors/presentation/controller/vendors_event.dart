part of 'vendors_bloc.dart';

abstract class VendorsEvent {}

class GetPublicVendorsEvent extends VendorsEvent {
  final String? searchQuery;

  GetPublicVendorsEvent({this.searchQuery});
}

class SearchVendorsEvent extends VendorsEvent {}

class ApplyInitialCategoryFilterEvent extends VendorsEvent {
  final int? categoryId;
  final String? categoryName;

  ApplyInitialCategoryFilterEvent({
    this.categoryId,
    this.categoryName,
  });
}

class GovernorateChangedVendorsEvent extends VendorsEvent {
  final String? governorate;

  GovernorateChangedVendorsEvent(this.governorate);
}

class CategoryChangedVendorsEvent extends VendorsEvent {
  final String? category;

  CategoryChangedVendorsEvent(this.category);
}

class WilayaChangedVendorsEvent extends VendorsEvent {
  final String? wilaya;

  WilayaChangedVendorsEvent(this.wilaya);
}
