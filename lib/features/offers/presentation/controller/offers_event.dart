part of 'offers_bloc.dart';

abstract class OffersEvent {}

class GetAllOffersEvent extends OffersEvent {}

class LoadMoreOffersEvent extends OffersEvent {}

class GovernorateChangedEvent extends OffersEvent {
  final String? governorate;

  GovernorateChangedEvent(this.governorate);
}

class CategoryChangedEvent extends OffersEvent {
  final String? category;

  CategoryChangedEvent(this.category);
}

class WilayaChangedEvent extends OffersEvent {
  final String? wilaya;

  WilayaChangedEvent(this.wilaya);
}

