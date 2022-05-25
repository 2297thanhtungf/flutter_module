// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_module/ultis/font_scale.dart';

class MCrectangle extends StatefulWidget {
  final String img;
  final String title;
  final String content;
  final Color titleColor;
  const MCrectangle(
      {Key? key,
      required this.img,
      required this.title,
      required this.content,
      this.titleColor = const Color(0xff0A2851)})
      : super(key: key);

  @override
  State<MCrectangle> createState() => _MCrectangleState();
}

class _MCrectangleState extends State<MCrectangle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffF8FBFF),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 24, top: 20, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Image.asset('assets/images/${widget.img}'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, textAlign: TextAlign.start)
                        .regularContext14(color: widget.titleColor),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      widget.content,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).semiBold18(color: Color(0xff0A2851)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
