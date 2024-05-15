import 'dart:developer';
import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_appp/screens/signUpPage/blocs/signu_bloc.dart';
import 'package:e_commerce_appp/screens/signUpPage/blocs/signup_events.dart';
import 'package:e_commerce_appp/screens/signUpPage/blocs/signup_states.dart';
import 'package:e_commerce_appp/screens/signUpPage/model/user_model.dart';
import 'package:e_commerce_appp/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (BuildContext context, SignUpState state) {
          if(state is LoadedState){
            log("Login SuccessFull");
            UiHelper.customSnacBar(context, msg: state.signUpModel.token.toString());
          }
          else if( state is ErrorState) {
            log("Error");
            UiHelper.customSnacBar(context, msg: state.errorMsg.toString());
          }
        },
        builder: (BuildContext context, SignUpState state) {
          if(state is LoadingState){
            return CircularProgressIndicator();
          } else {
            return Center(
                  child: signUpWidget()
              );
          }
        },
      ),
    );
  }

  Widget signUpWidget(){
    return Column(
      children: [
        UiHelper.customTextField(
          controller: firstNameController,
          icon: Icons.person,
          HintText: "Enter First Name",
        ),
        UiHelper.customTextField(
          controller: lastNameController,
          icon: Icons.person,
          HintText: "Enter Last Name",
        ),
        UiHelper.customTextField(
          controller: emailController,
          icon: Icons.email,
          HintText: "Enter Email Name",
        ),
        UiHelper.customTextField(
          controller: passwordController,
          icon: Icons.password,
          HintText: "Enter First Name",
        ),
        UiHelper.customTextField(
          controller: phoneController,
          icon: Icons.phone,
          HintText: "Enter First Name",
        ),
        UiHelper.customBtn(() {
          signUpData(
              firstName: firstNameController.text.toString(),
              lastName: lastNameController.text.toString(),
              email: emailController.text.toString(),
              phone: phoneController.text.toString(),
              password: passwordController.text.toString()
          );
        }, btnName: "Register")
      ],
    );
  }

  signUpData({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required password,
  }){
    if(firstName == "" || lastName == "" || email == "" || password == "" || phone == ""){
      log("please enter Data");
      UiHelper.customSnacBar(context, msg: "please enter data");
    } else {
      context.read<SignUpBloc>().signUp(
          UserModel(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              phone: phone
          )
      );
      log("Data added");
    }
  }

}
