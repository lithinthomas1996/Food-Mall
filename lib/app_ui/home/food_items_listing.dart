


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/home/home_bloc.dart';
import 'package:my_test_appp/bloc/home/home_event.dart';
import 'package:my_test_appp/bloc/home/home_state.dart';
import 'package:my_test_appp/styles/widget_styles.dart';

class ItemsListingArguments {
  final String grpId, grpName;
  const ItemsListingArguments({Key? key, required this.grpId, required  this. grpName}) ;
}


class FoodItemsListing extends StatefulWidget{
  final ItemsListingArguments itemsListingArguments;
  const FoodItemsListing({Key? key,  required  this. itemsListingArguments}) : super(key: key);

  @override
  _FoodItemsListing createState() => _FoodItemsListing();
}
class _FoodItemsListing extends State<FoodItemsListing>{

  @override
  void initState(){
    BlocProvider.of<FoodBloc>(context).add(FoodRefreshEvent());
    BlocProvider.of<FoodBloc>(context).add(GetCatListing(catId: widget.itemsListingArguments.grpId));
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemsListingArguments.grpName),
      ),

      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {

          if(state is FoodItemsListingState) {
            return ListView.builder(
              itemCount: state.listingModel!.data!.length,
                itemBuilder:  (BuildContext context, index) {

                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:   [
                        const Expanded(
                          flex: 0,
                          child: Image(
                              height: 100,
                               width:  150,
                              fit: BoxFit.fitHeight,
                              image: NetworkImage("https://media.istockphoto.com/photos/various-fresh-dairy-products-picture-id544807136?k=20&m=544807136&s=612x612&w=0&h=iqb23gbUKWgewmunHXd_yzJbYsZDa0fMDz64Ux6OJSc=")),
                        ),
                        const SizedBox(width: 10.0,),
                        Expanded( 
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.listingModel!.data![index].cItemName!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppWidgets.groupHeadingStyle, ),
                              const SizedBox(height: 10.0,),
                              Text(state.listingModel!.data![index].nBalanceAmt!.toString(), style: TextStyle(fontWeight: FontWeight.w700),),
                              const SizedBox(height: 5.0,),
                              Text("Special Offer", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );

                });
          }

          else if(state is FoodItemsListingErrorState) {
            return Center(
              child: Text(state.errorMsg!),
            );
          }

          else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

        }),


    );

  }

}