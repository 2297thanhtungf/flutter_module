
import 'package:flutter/material.dart';
import 'package:test_module/ultis/app_color.dart';
import 'package:test_module/ultis/font_scale.dart';
import 'dart:io';

class MCScaffold extends StatefulWidget {
  final Widget child;
  final String appbarTitle;
  final Color appbarTextColor;
  final Color? appbarColor;
  final Widget? leading;
  final List<Widget>? trailingActions;
  final bool automaticallyImplyLeading;
  final bool resizeToAvoidBottomPadding;
  final Widget? rightDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool showDivider;
  final Color titleColor;
  final Color colorBg;
  // final double height;
  const MCScaffold({
    Key? key,
    this.appbarTitle = '',
    this.appbarTextColor = AppColors.titleTextColor,
    this.leading ,
    this.trailingActions,
    this.automaticallyImplyLeading = false,
    this.resizeToAvoidBottomPadding = true,
    required this.child,
    this.appbarColor,
    this.rightDrawer,
    this.scaffoldKey,
    this.showDivider = true,
    this.titleColor = const Color(0xff969FA2),
    this.colorBg = Colors.white,
    // this.height = Platform.isIOS ? kToolbarHeight : 44,
  }) : super(key: key);

  @override
  _MCScaffoldState createState() => _MCScaffoldState();
}

class _MCScaffoldState extends State<MCScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.colorBg,
      key: widget.scaffoldKey,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomPadding,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            Platform.isAndroid ? kToolbarHeight : 44),
        child: AppBar(
          leading: widget.leading,
          title: Platform.isIOS
              ? Text(widget.appbarTitle).semiBold14(color: widget.titleColor)
              : Text(widget.appbarTitle).semiBold16(color: widget.titleColor),
          actions: widget.trailingActions,
          backgroundColor: widget.appbarColor,
          elevation: 0,
          bottomOpacity: 0.0,
          centerTitle: true,
          titleSpacing: widget.leading != null ? 0 : 16,
          automaticallyImplyLeading: widget.automaticallyImplyLeading ,
        ),
      ),
      endDrawer: widget.rightDrawer,
      body: Column(children: [
        widget.showDivider
            ? Container(height: 1, color: Color(0xffF2F3F4))
            : Container(),
        Expanded(child: widget.child),
      ]),
    );
  }
}
