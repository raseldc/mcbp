import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';

import '../../widgets/snackbar_alert.dart';

void showToast(BuildContext context, String msg) {
  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}

void onBasicAlertPressed(context,title,body) {
    Alert(
      context: context,
      title: title,
      desc: body,
    ).show();
  }

bool _registrationValidation(context){

  return false;
}