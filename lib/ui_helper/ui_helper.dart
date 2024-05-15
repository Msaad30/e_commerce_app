import 'package:flutter/material.dart';

class UiHelper{
  static customTextField({required TextEditingController controller, required IconData icon, required String HintText}){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: HintText,
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
    );
  }

  static customBtn(VoidCallback callback, {required String btnName}){
    return ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(200, 40)
        ),
        child: Text(
          btnName
        ),
    );
  }
  
  static customSnacBar(BuildContext context, {required String msg}){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}