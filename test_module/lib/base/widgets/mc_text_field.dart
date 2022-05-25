// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_module/ultis/app_color.dart';
import 'package:test_module/ultis/numberic_formatter.dart';

class MCTextField extends StatefulWidget {
  final String hindText;
  const MCTextField({Key? key, this.hindText = ''}) : super(key: key);

  @override
  State<MCTextField> createState() => _MCTextFieldState();
}

class _MCTextFieldState extends State<MCTextField> {
  late TextEditingController _controller;
  FocusNode _focusNode = FocusNode();
  RegExp pattern = RegExp(r'\D');
  String _textError = '';

  @override
  void initState() {
    _controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xffF4F7FA),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: 0, color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: 1,
                child: Visibility(
                  visible: false,
                  child: Container(
                    height: 16,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        'la cai gi',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 11,
                            fontFamily: "SVN",
                            color: Color(0xffA3A3A3)),
                      ),
                    ),
                  ),
                )),
            Container(
              height: 20,
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 20,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SVN',
                      color: AppColors.titleTextColor),
                  controller: _controller,
                  onTap: () {
                    if (!_focusNode.hasFocus) {
                      _focusNode.requestFocus();
                    }
                  },
                  autofocus: false,
                  focusNode: _focusNode,
                  inputFormatters: [
                    ThousandsFormatter(),
                  ],
                  decoration: InputDecoration(
                    hintText: widget.hindText,
                    contentPadding:
                        EdgeInsets.only(left: 12, top: 12, bottom: 0),
                    // labelText: 'giá',
                    labelStyle: _textError.isNotEmpty
                        ? TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'SVN',
                            color: AppColors.textErrorColor)
                        : TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'SVN',
                            color: AppColors.inactiveIconColor),
                    counterText: "",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'SVN',
                        color: AppColors.hintColor),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 1),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
