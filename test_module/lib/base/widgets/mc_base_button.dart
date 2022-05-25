import 'package:flutter/material.dart';
import 'package:test_module/ultis/font_scale.dart';

class MCBaseButton extends StatefulWidget {
  final Function onPressed;
  final bool isEnable;
  final bool isPadding;
  final double height;
  final String title;
  final Color color;
  final Color textColor;

  MCBaseButton(
      {Key? key,
      required this.onPressed,
      this.isEnable = true,
      this.isPadding = true,
      this.height = 54,
      required this.title,
      this.color = const Color(0xff0A73F0),
      this.textColor = Colors.white})
      : super(key: key);
  @override
  State<MCBaseButton> createState() => _MCBaseButtonState();
}

class _MCBaseButtonState extends State<MCBaseButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isEnable) {
          widget.onPressed();
        }
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: widget.isPadding == true ? 16 : 0),
        width: double.infinity,
        height: widget.height,
        decoration: BoxDecoration(
          // image: widget.color == mainColor ? DecorationImage(
          //   image: AssetImage(
          //       widget.isEnabled ? 'assets/images/new_year/bg_btn.png' : 'assets/images/new_year/bg_btn_deactive.png'),
          //   fit: BoxFit.cover,
          // ) : null,
          color: widget.isEnable ? widget.color : Color(0xffA0A4A8),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child:
              Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis)
                  .semiBold16(color: widget.textColor),
        ),
      ),
    );
  }
}
