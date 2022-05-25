import 'dart:io';

import 'package:flutter/material.dart';

platformIconBack(Color color) {
  return Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
      color: color, size: 24);
}

platformIconClose(Color color) {
  return Icon(Platform.isIOS ? Icons.close : Icons.close,
      color: color, size: 24);
}
