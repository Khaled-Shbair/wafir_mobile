part of 'vendors_bloc.dart';

abstract class VendorsState {}

class VendorsInitial extends VendorsState {}

class VendorsLoading extends VendorsState {}

class VendorsLoaded extends VendorsState {
  final List<VendorPublicItemModel> vendors;

  VendorsLoaded({required this.vendors});
}

class VendorsFailure extends VendorsState {
  final String message;

  VendorsFailure({required this.message});
}

