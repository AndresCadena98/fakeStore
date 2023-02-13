import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
class LoginService {
  LoginService() : super();
  Dio dio = Dio();
  String? token;
  List<String> getVacDates(String s) => [
      for (final timeline in jsonDecode(s)['timeline'])
        timeline['date'] as String
    ];
  @override
  Future registerUser(
      String? username, String? name, String? lastname, String? pass,String? email) async {
    final response = await dio.post('https://fakestoreapi.com/users', queryParameters: {
      'email': email,
      'username': username,
      'password': pass,
      'name': {'firstname': name, 'lastname': lastname},
      'address': {
        'city': 'kilcoole',
        'street': '7835 new road',
        'number': 3,
        'zipcode': '12926-3874',
        'geolocation': {'lat': '-37.3159', 'long': '81.1496'}
      },
      'phone': '1-570-236-7033'
    });
    var id;
    if (response.statusCode == HttpStatus.ok) {
      
      print(response);
       id = response.data['id'];
    }
    return id;

  }
  Future loginUser(
      String? username,String? pass) async {
    final response = await dio.post('https://fakestoreapi.com/auth/login', data: {
      'username': username,
      'password': pass,
     
    });
    
    
  if (response.statusCode == HttpStatus.ok) {
      
      print(response);
       token = response.data['token'];
    }
    return token;

  }
}
