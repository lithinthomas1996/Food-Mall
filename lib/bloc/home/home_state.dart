
import 'package:equatable/equatable.dart';
import 'package:my_test_appp/data_models/group_model.dart';
import 'package:my_test_appp/data_models/listing_model.dart';

abstract class FoodState extends Equatable {
  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodProgressState extends FoodState {}


class FoodRefreshState extends FoodState {}

class FoodGroupListingState extends FoodState {
  final GroupModel? groupModel;
  FoodGroupListingState({required this.groupModel });
}

class FoodGroupListingErrorState extends FoodState {
  final String? errorMsg;
  FoodGroupListingErrorState({required this.errorMsg });
}

class FoodItemsListingState extends FoodState {
  final ListingModel? listingModel;
  FoodItemsListingState({required this.listingModel });
}

class FoodItemsListingErrorState extends FoodState {
  final String? errorMsg;
  FoodItemsListingErrorState({required this.errorMsg });
}