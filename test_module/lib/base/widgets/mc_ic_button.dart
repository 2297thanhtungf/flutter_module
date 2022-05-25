import 'package:flutter/material.dart';

class MCIconButton extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Icon icon;
  final VoidCallback onPress;

  const MCIconButton(
      {Key? key,
      this.size = 24,
      this.backgroundColor = Colors.white,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  _MCIconButtonState createState() => _MCIconButtonState();
}

class _MCIconButtonState extends State<MCIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: IconButton(
        padding: EdgeInsets.only(left: 12),
        icon: widget.icon,
        onPressed: widget.onPress,
        iconSize: widget.size,
      ),
    );
  }
}
