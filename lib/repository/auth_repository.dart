import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/data/network/BaseApiResponse.dart';
import 'package:mvvm_provider/data/network/networkApiResponse.dart';
import 'package:mvvm_provider/res/component/app_url.dart';
import 'package:mvvm_provider/utils/routes/general_utils.dart';

class AuthRepository{
  BaseApiServices authServices = NetworkApiServices();
  Future<dynamic> LoginApi(dynamic data, BuildContext context)async{
    try{
      dynamic response = await  authServices.getPostApiServices(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
       Utils.snakBarmessage(e.toString(), context);
    }

  }
  Future<dynamic> RegisterApi(dynamic data,  BuildContext context)async{
    try{
      dynamic response = await  authServices.getPostApiServices(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      Utils.snakBarmessage(e.toString(), context);
    }
  }
}