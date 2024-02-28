import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/repository/auth_repository.dart';
import 'package:mvvm_provider/utils/routes/general_utils.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier{

  bool loading  = false;
  setValue(bool value){
    loading = value;
    notifyListeners();
  }
  final repo = AuthRepository();

  Future<dynamic> login(dynamic data, BuildContext context)async{
   setValue(true);

    repo.LoginApi(data, context).then((value){
      setValue(false);

      Navigator.pushNamed(context, RoutesName.home);


    }).onError((error, stackTrace) {
      setValue(false);
      Utils.snakBarmessage(error.toString(), context);
    });
  }
  Future<dynamic> register(dynamic data, BuildContext context)async{
    setValue(true);
    repo.RegisterApi(data, context).then((value){
      setValue(false);
      Navigator.pushNamed(context, RoutesName.login);
    }).onError((error, stackTrace) {
      setValue(false);
      Utils.snakBarmessage(error.toString(), context);
    });;
  }
}