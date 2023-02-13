import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fake_store/features/home/service/loginService.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_register_state.dart';


class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  
    LoginRegisterCubit() : super(LoginRegisterState());
  var _repo = LoginService();
  int? id;
  String? token;
   register(String? username, String? name, String? lastname,String? pass,String? email) {
    _repo.registerUser(username,name,lastname,pass,email).then((value) async{
      
      id = value;
    });
    return id;
  }
   login(String? username,String? pass) {
    
   
     _repo.loginUser(username,pass).then((value) async{
      token = value;
      final prefs = await SharedPreferences.getInstance();
       prefs.setString('token', value);
     });
      

  return token;
  }




}
