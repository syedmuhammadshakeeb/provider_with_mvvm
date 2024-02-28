import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/models/user_model.dart';
import 'package:mvvm_provider/utils/routes/general_utils.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';

class SplashServices{
  Future<userModel?> getUserData() => userViewModel().getUser();

  void userAuthetication(BuildContext context){
    getUserData().then((value){
      if(value!.token == 'null' || value!.token == ''){
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace){
      Utils.snakBarmessage(error.toString(), context);
    });
  }
}