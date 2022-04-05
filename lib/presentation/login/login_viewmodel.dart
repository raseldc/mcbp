import 'dart:async';
import 'package:mcbp/presentation/base/base_viewmodel.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  final StreamController _usernameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameStreamController.close();
    _passwordStreamController.close();
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
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  setUserName(String username) {
    inputUsername.add(username);
  }


  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username){
    return username.isNotEmpty;
  }

}

// Inputs will receives event from view
abstract class LoginViewModelInputs{
  setUserName(String username);

  setPassword(String password);
  login();
  Sink get inputUsername;
  Sink get inputPassword;
}

// serve data to view
abstract class LoginViewModelOutputs{
  Stream<bool> get outputIsUserNameIsValid;
  Stream<bool> get outputIsPasswordValid;
}
