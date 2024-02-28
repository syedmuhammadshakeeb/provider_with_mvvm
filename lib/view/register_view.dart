import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/component/round_botton.dart';
import '../utils/routes/general_utils.dart';
class registerView extends StatefulWidget {
  const registerView({super.key});

  @override
  State<registerView> createState() => _registerViewState();
}

class _registerViewState extends State<registerView> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier(true);
  TextEditingController emailcontroller  = TextEditingController();
  TextEditingController passwordcontroller  = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    obsecurePassword.dispose();
    emailFocus.dispose();
    emailcontroller.dispose();
    passwordFocus.dispose();
    passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
final authProvider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailcontroller,
            focusNode: emailFocus,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.alternate_email_outlined),
              labelText: 'Email',

            ),
            onFieldSubmitted: (value){
              Utils.changeFocus(context, emailFocus, passwordFocus);
            },

          ),
          const SizedBox(height: 10,),
          ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (context , value , child){
                return TextFormField( keyboardType: TextInputType.emailAddress,
                  controller: passwordcontroller,
                  focusNode: passwordFocus,
                  obscureText: obsecurePassword.value,
                  decoration:  InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_outlined),

                      suffixIcon: InkWell(
                          onTap: (){
                            obsecurePassword.value = !obsecurePassword.value;
                          },
                          child: Icon( obsecurePassword.value ? Icons.visibility_off:Icons.visibility)),
                      labelText: 'password'

                  ),);
              }),
          const SizedBox(height: 20,),
          RoundBotton(
              text: 'Sign up',
              loading: authProvider.loading,
              onpress: (){
                if(emailcontroller.text.isEmpty){
                  Utils.snakBarmessage('Enter email', context);
                }else if(passwordcontroller.text.isEmpty){
                  Utils.snakBarmessage('Enter password', context);
                }else if(passwordcontroller.text.length < 6){
                  Utils.snakBarmessage('Enter 6 digit pasword', context);
                }else{
                  dynamic data  = {
                    'email' : emailcontroller.text.toString(),
                    "password" : passwordcontroller.text.toString(),
                  };
                  authProvider.register(data, context);
                }



              }),
          InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Text('Alredy have an account? login')),

        ],
      ),
    );
  }
}
