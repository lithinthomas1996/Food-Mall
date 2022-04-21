

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/home/home_event.dart';
import 'package:my_test_appp/bloc/home/home_state.dart';
import 'package:my_test_appp/data_models/group_model.dart';
import 'package:my_test_appp/data_models/listing_model.dart';
import 'package:my_test_appp/utils/web_client.dart';



class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()){
    on<FoodRefreshEvent>((event, emit) => emit(FoodRefreshState()));


    // get cats

    on<GetFoodCatEvent>((event, emit)async {
      emit (FoodProgressState());

      Map sendData = {};

      try{

        var response = await ApiServices.servicePost('/GetItemGroups', sendData);
        if(response[0]['Status'] == "success") {
          final GroupModel groupModel = GroupModel.fromJson(response[0]);
          emit (FoodGroupListingState(groupModel: groupModel));
        }
        else {
          emit (FoodGroupListingErrorState(errorMsg: response[0]['Message']));
        }
      }

      catch(e){
        print(e.toString());
        emit (FoodGroupListingErrorState(errorMsg: e.toString()));
      }
    });



    // Items Lsting
    on<GetCatListing>((event, emit)async {
      emit (FoodProgressState());

      try{
        var response = await ApiServices.serviceGet('//ItemList?itemGroupId=${event.catId}');
        if(response[0]['Status'] == "success") {
          final ListingModel listingModel = ListingModel.fromJson(response[0]);
          emit (FoodItemsListingState(listingModel: listingModel));
        }
        else {
          emit (FoodItemsListingErrorState(errorMsg: response[0]['Message']));
        }
      }

      catch(e){
        print(e.toString());
        emit (FoodGroupListingErrorState(errorMsg: e.toString()));
      }
    });

  }
}