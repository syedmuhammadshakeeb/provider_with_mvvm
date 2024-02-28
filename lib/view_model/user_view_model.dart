import 'package:flutter/material.dart';
import 'package:mvvm_provider/models/user_model.dart';
import 'package:mvvm_provider/utils/routes/general_utils.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userViewModel extends ChangeNotifier{

 Future<bool?> setUser(userModel user)async{
  SharedPreferences sp =await SharedPreferences.getInstance();
 sp.setString('token', user.token.toString());
 notifyListeners();
 return true;
 }
 Future<userModel?> getUser()async{
  SharedPreferences sp =await SharedPreferences.getInstance();
  final String? token = sp.getString('token');
  return userModel(
   token: token.toString()
  );}

 Future<bool?> removeUser(BuildContext context)async{
  SharedPreferences sp =await SharedPreferences.getInstance();
  return sp.remove('token').then((value){
   Navigator.pushNamed(context, RoutesName.login);
  }).onError((error, stackTrace) {
   Utils.snakBarmessage(error.toString(), context);
  });

 }

}