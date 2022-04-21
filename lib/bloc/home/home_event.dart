
import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Progress extends FoodEvent{}

class FoodRefreshEvent extends FoodEvent{}

class GetFoodCatEvent extends FoodEvent{}

class GetCatListing extends FoodEvent{
  final String catId;
  GetCatListing({required this.catId });
}