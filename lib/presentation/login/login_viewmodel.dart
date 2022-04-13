import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mcbp/presentation/base/base_viewmodel.dart';

import '../../utils/helpers/helper.dart';
import '../home/home_page.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  String name = "";
  String password = "";

  final StreamController _usernameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _isFieldsValidController = StreamController<void>.broadcast();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameStreamController.close();
    _passwordStreamController.close();
    _isFieldsValidController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUsername
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameIsValid
  Stream<bool> get outputIsUserNameIsValid =>
      _usernameStreamController.stream.map((username) => _isUsernameValid(username));

  @override
  // TODO: implement inputFieldsAreValid
  Sink get inputFieldsAreValid => _isFieldsValidController;

  @override
  // TODO: implement outputFieldsAreValid
  Stream<bool> get outputFieldsAreValid =>
      _isFieldsValidController.stream.map((_) => _isAllInputsValid());

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    this.password = "";
    this.password = password;
  }

  @override
  setUserName(String username) {
    inputUsername.add(username);
    name = "";
    name = username;
  }


  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username){
    return username.isNotEmpty;
  }

  bool _isAllInputsValid(){
    return (name.isNotEmpty && password.isNotEmpty);
  }


  loginBtn(context,db) async{
    if(name.isEmpty) {
      showToast(context, "User Id Required");
    }else if(password.isEmpty){
      showToast(context, "Please Provide Password");
    }else{
      await db.loginAuth(name,password).then((response){
        showToast(context, "Login Successfully");
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> HomePage()),((Route<dynamic> route) => false));
      }).catchError((error){
        showToast(context, "$error");
      });
    }

  }



}

// Inputs will receives event from view
abstract class LoginViewModelInputs{
  setUserName(String username);

  setPassword(String password);
  login();
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputFieldsAreValid;
}

// serve data to view
abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameIsValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputFieldsAreValid;

}
