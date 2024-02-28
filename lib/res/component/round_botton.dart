
import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/component/colors.dart';
class RoundBotton extends StatelessWidget {

  String text;
  VoidCallback onpress;
  bool loading;
   RoundBotton({super.key, required this.text , required this.loading, required this.onpress});
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onpress,
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(20),

        ),
        child: Center(child: loading ? const CircularProgressIndicator(color: ColorsName.blackColor,):
        Text(text,
          style:
          const TextStyle(
              color: ColorsName.blackColor,
              fontSize: 16
          ),
        )
        ),
      ),
    );
  }
}
