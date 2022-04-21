import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_bloc.dart';
import 'package:my_test_appp/bloc/home/home_bloc.dart';
import 'package:my_test_appp/bloc/timmer/timerBloc.dart';
import 'package:my_test_appp/styles.dart';
import 'package:my_test_appp/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        BlocProvider<TimerBloc>(create: (BuildContext context) => TimerBloc()),
        BlocProvider<FoodBloc>(create: (BuildContext context) => FoodBloc()),
      ],
      child: MaterialApp(
        title: 'My Test App',
        initialRoute: '/',
        routes: Routes.a,
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.appTheme
      ),
    );
  }
}

class NavigationService{
  GlobalKey<NavigatorState>? navigationKey;
  static  NavigationService instance = NavigationService();
  NavigationService(){
    navigationKey = GlobalKey<NavigatorState>();
  }
  Future<dynamic> navigateTo(var _rn){
    return navigationKey!.currentState!.pushNamed(_rn);
  }
}
