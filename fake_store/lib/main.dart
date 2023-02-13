import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store/cubit/login_register_cubit.dart';
import 'package:fake_store/features/home/view/home_view.dart';
import 'package:fake_store/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Custom color
getToken()async{
     final prefs = await SharedPreferences.getInstance();
     var token = prefs.getString('token');
     print(token)
;     return token;
   
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getToken();
    return BlocProvider(
      create: (context) => LoginRegisterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Stoman',
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'GeneralSans',
        ),
        home:  getToken() == null ? HomeScreen():HomeView(),
      ),
    );
  }
}
