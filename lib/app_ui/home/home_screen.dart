


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/home/home_bloc.dart';
import 'package:my_test_appp/bloc/home/home_state.dart';
import 'package:my_test_appp/styles/widget_styles.dart';
import 'package:my_test_appp/utils/pref_manager.dart';

import '../../bloc/home/home_event.dart';
import 'food_items_listing.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{

@override
void initState(){
  BlocProvider.of<FoodBloc>(context).add(FoodRefreshEvent());
  BlocProvider.of<FoodBloc>(context).add(GetFoodCatEvent());
  super.initState();

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: AppBar(
        title: const Text("Food Mall"),
      ),
      
      body: BlocBuilder<FoodBloc, FoodState>(
          buildWhen: (previous, current) {
            if (current is FoodGroupListingState) {
              return true;
            } else if(current is FoodGroupListingErrorState) {
              return true;
            } else {
              return false;
            }
          },

        builder: (context, state) {
          if(state is FoodGroupListingState) {
            return GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2.1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),

                itemCount: state.groupModel!.data!.length,

                itemBuilder:  (BuildContext context, index) {
                  return Card(
                    elevation: 5.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: InkWell(
                      onTap: ()=>  Navigator.pushNamed(context, "/foodItemsListing", arguments: ItemsListingArguments(grpId: state.groupModel!.data![index].nItemGrpId!.toString(), grpName:  state.groupModel!.data![index].cGrpName!)),
                      child: Column(
                        children:   [
                          const SizedBox(height: 5.0,),
                          const Image(
                            height: 100,
                            width: double.infinity,

                            fit: BoxFit.fitWidth,
                            image: NetworkImage("https://media.istockphoto.com/photos/various-fresh-dairy-products-picture-id544807136?k=20&m=544807136&s=612x612&w=0&h=iqb23gbUKWgewmunHXd_yzJbYsZDa0fMDz64Ux6OJSc="),
                          ),
                          const SizedBox(height: 10.0,),
                          Text(state.groupModel!.data![index].cGrpName!,  style: AppWidgets.groupHeadingStyle,)
                        ],
                      ),
                    ),
                  );
                });
          }

          else if(state is FoodGroupListingErrorState) {
            return Center(
              child:   Text(state.errorMsg!, style: TextStyle(fontWeight: FontWeight.w600),),
            );
          }

          else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        }),


    );
  }

  Widget drawer(BuildContext context){
    return Drawer(
      child: ListView(
// Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Hello', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                SizedBox(height: 10.0,),
                Text("iD 12345", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
// Update the state of the app.
// ...
            },
          ),
          ListTile(

            title: const Text('Logout'),
            onTap: () {
              PrefManager.clearPrefManager();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

// Update the state of the app.
// ...
            },
          ),
        ],
      ), // Populate the Drawer in the next step.
    );
  }


}