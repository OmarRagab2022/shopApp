import 'package:e_commrce/services/constant.dart';
import 'package:e_commrce/services/local/cache_helper.dart';
import 'package:e_commrce/services/network/dio_helper.dart';
import 'package:e_commrce/view/auth/logIn/login.dart';
import 'package:e_commrce/view/layout.dart';
import 'package:e_commrce/view/onBoarding/on_boarding.dart';
import 'package:e_commrce/viewModel/home/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget widget;
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'userToken');
  if(token != null){
    widget = ShopLayout();
  }else{
    widget = LoginScreen();
  }
  runApp( MyApp(
    widget:  widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget widget;
   MyApp({Key? key, required this.widget}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategoriesData()
            ..getFavoritesData(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home: widget,
      ),
    );
  }
}

