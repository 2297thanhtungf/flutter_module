import 'dart:io';

import 'package:flutter/material.dart';

class PhotoView extends StatefulWidget {
  final String url;

  const PhotoView({
    Key? key,
    required this.url,
  });

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(Platform.isAndroid ? kToolbarHeight : 44),
        child: AppBar(
            leading: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                color: Colors.black, size: 24),
          ),
        )),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Image.network(widget.url,
              alignment: Alignment.center, width: double.infinity),
        ),
      ),
    );
  }
}
