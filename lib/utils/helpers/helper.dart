import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../widgets/snackbar_alert.dart';

void showToast(BuildContext context, String msg) {
  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
}
