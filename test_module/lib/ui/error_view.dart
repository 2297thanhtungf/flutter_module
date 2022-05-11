import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_module/ultis/constants.dart';
class ErrorView extends StatefulWidget {
  const ErrorView({ Key? key }) : super(key: key);

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: () async {
            final bool result = await Constants.backToNativeChannel
        .invokeMethod('listen_back_from_module',);
        print('==========LOG result:$result');
          },
          padding: EdgeInsets.zero,
          icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Colors.black, size: 24),
        ),
      )),
      body: SafeArea(
        child: InkWell(
          onTap: (){},
          child: Center(
            child: Text('ErrorView, Click back to Android native'),
          ),
        ),
      ),
    );
  }
}